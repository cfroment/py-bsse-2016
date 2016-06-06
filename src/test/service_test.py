'''
Created on Nov 29, 2013

@author: be07336
'''
import unittest
from src.service import Service


class Test(unittest.TestCase):
    def test_missing_evaluators(self):
        service = Service.get_instance()
        missing = service.get_missing_evaluators()
        for missin in missing:
            print(missin)

    def test_get_candidates(self):
        service = Service.get_instance()
        candidates = service.all_candidates()
        self.assertIsNotNone(candidates, "Candidates should not be null")
        for candidate in candidates:
            print(candidate.id, candidate.name)

    def test_get_candidate(self):
        service = Service.get_instance()
        candidate = service.get_candidate(candidate_id=1)
        self.assertIsNotNone(candidate, "Candidate should not be None")
        print(candidate.id, candidate.name)
        print("Evaluation size", len(candidate.evaluations))
        somme = 0
        for evaluation in candidate.evaluations:
            somme += evaluation.grade
            print(evaluation.grade)
        print("Grade sum", somme)


if __name__ == "__main__":
    # import sys;sys.argv = ['', 'Test.testName']
    unittest.main()
