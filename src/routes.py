"""
Created on Nov 29, 2013

@author: be07336
"""
from flask import Flask, render_template, request, flash, redirect, url_for, g
from result_service import get_comments_per_criterion
from service import Service
from user_service import UserService
from flask_login import LoginManager, login_required, login_user, current_user, logout_user
from model.candidate import Evaluation, Ranking
from decimal import *

app = Flask(__name__)
app.secret_key = 'super secR3t k3y !!'

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'


def __parse_evaluation_form(form=None, candidate_id=None):
    evaluations = {}
    # keys have syntax: 'grade'-criterion(id)-evaluation(id)
    # keys have syntax: 'comments'-criterion(id)-evaluation(id)
    for key in filter(lambda k: k.startswith('grade'), form.keys()):
        splits = key.split('-')
        if splits[2] == 'None':
            splits[2] = None
        try:
            evaluations[splits[1]] = Evaluation(id=splits[2],
                                                candidate=int(candidate_id),
                                                criterion=int(splits[1]),
                                                evaluator=int(g.user.id),
                                                grade=round(Decimal(form[key].replace(',', '.')), 1))
        except:
            raise
    for key in filter(lambda k: k.startswith('comments'), form.keys()):
        splits = key.split('-')
        try:
            evaluations[splits[1]].comments = (form[key] if form[key] is not None else None)
        except:
            raise
    return list(evaluations.values())
    # returns a list of evaluations


@app.route('/')
def index():
    return render_template('base.html')


@app.route('/login', methods=('GET', 'POST'))
def login():
    if request.method == 'GET':
        return render_template("login.html")

    email = request.form['email']
    password = request.form['password']
    registered_user = Service.get_evaluator(evaluator_email=email, evaluator_password=password)

    if registered_user is None:
        flash('Username or Password is invalid', 'error')
        return redirect(url_for('login'))
    login_user(registered_user)
    flash("Logged in successfully!")
    return redirect(request.args.get('next') or url_for('index'))


@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('index'))


@app.route('/candidates')
@login_required
def candidates():
    all_candidates = Service.all_candidates()
    progress = Service.get_progress(evaluator_id=current_user.id)
    return render_template('candidates.html', candidates=all_candidates, progress=progress)


@app.route('/results')
@login_required
def results():
    return render_template('results.html')


@app.route('/profile', methods=('GET', 'POST'))
@login_required
def profile():
    user = UserService.get_user(user_id=current_user.id)
    missing = UserService.get_missing_evaluations(user.id)
    if 'GET' == request.method:
        return render_template("profile.html", user=user, missing_evaluations=missing)
    data = dict(request.form)
    if data['password'][0] != user.password:
        return render_template("profile.html", user=user, error_message="Wrong password!")
    elif data['newPassword'][0] != data['confirmPassword'][0]:
        return render_template("profile.html", user=user, error_message="Non-matching password!")
    else:
        user.password = data['newPassword'][0]
        user = UserService.update_user(user)
        return render_template("profile.html", user=user, info_message="Information updated!")


@app.route('/report/<candidate_id>')
@login_required
def report(candidate_id):
    candidate = Service.get_candidate(candidate_id=candidate_id)
    comments = get_comments_per_criterion(candidate_id=candidate_id)
    criteria = Service.get_criteria()
    grades={}
    try:
        grades = Service.get_criteria_average()[candidate.name]
    except :
        print("No grades here. Key error.")
    return render_template('report.html', candidate=candidate, criteria=criteria, comments=comments, grades=grades)


@app.route('/evaluate/<candidate_id>', methods=('GET', 'POST'))
@login_required
def evaluate(candidate_id):
    if request.method == 'GET':
        candidate = Service.get_candidate(candidate_id=candidate_id)
        ranking = Service.get_ranking(candidate_id=candidate_id, evaluator_id=current_user.id)
        criteria = Service.get_criteria()
        evaluations = Service.get_evaluations(candidate_id=candidate_id, evaluator_id=current_user.id)
        return render_template('evaluate.html', candidate=candidate, criteria=criteria, evaluations=evaluations,
                               ranking=ranking)

    if request.method == 'POST':
        evaluations = __parse_evaluation_form(request.form, candidate_id=candidate_id)
        new_ranking = Ranking(
            ranking=int(request.form['ranking']) if request.form['ranking'] else None,
            evaluator=int(g.user.id),
            candidate=int(candidate_id)
        )
        Service.save_evaluations(evaluations=evaluations)
        Service.save_ranking(ranking=new_ranking)
        return redirect(url_for('candidates'))


@app.route('/admin')
@login_required
def admin_summary():
    if not request.method == 'GET':
        return redirect(url_for('index'))
    if g.user.id != 0:
        return redirect(url_for('index'))
    missing = Service.get_missing_evaluators()
    ranking_sum = Service.get_ranking_result()
    criteria_average = Service.get_criteria_average()
    system_ranking = Service.get_system_ranking()
    return render_template('admin_summary.html', missing_evaluators=missing, ranking_sum=ranking_sum,
                           criteria_average=criteria_average, system_ranking=system_ranking)


@login_manager.user_loader
def load_user(user_email):
    return Service.get_user(user_email)


@app.before_request
def before_request():
    g.user = current_user


if __name__ == '__main__':
    app.run(debug=True, port=5999)
