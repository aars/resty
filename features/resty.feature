Feature: Querying an API
  In order to easily interact with an API from the commandline
  As an Api builder and/or consumer
  I want to be able to query easily any api

Scenario: I can run a cucumber test
  Given a file named "file.txt" with:
   """
   Hello Resty
   """
  Then the file "file.txt" should contain:
   """
   Hello Resty
   """
