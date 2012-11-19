Example of completing not playing nicely with ecukes

This uses Carton to manage dependencies, so just run carton to create elpa subdirectory. 

I added the following to `elpa/ecukes-20121008.17007` in order for it to find ansi: 

    (mapc 
     (lambda (new) (add-to-list 'load-path new))
     (file-expand-wildcards "elpa/*"))        

`ecukes-test.el` has a few simple functions that prompt the user to choose from a list of available colors. 

`test/test.sh` runs the ert tests. The test prompst for a color, and if you enter "CadetBlue", the test passes successfully as expected: 

     dparoulek@centurion:~/code/elisp/ecukes-test$ ./test/test.sh 
     Running 2 tests (2012-11-19 11:54:12-0500)
     Choose Color: CadetBlue
     You chose: CadetBlue!
        passed  1/2  et-choose-color
        passed  2/2  et-sanity-check

     Ran 2 tests, 2 results as expected (2012-11-19 11:54:19-0500)

When I try to run either `ecukes` or `ecukes --graphical`, I get the following: 

     dparoulek@centurion:~/code/elisp/ecukes-test$ ecukes
     Feature: Test Completing using ecukes
       In order to test functions that use completing method calls
       As an Ecukes user
       I want to run this feature successfully
        
        
       Scenario: Choose Color
     You chose: !
         When I press "M-x et-choose-color"
         And I press "RET"
         And I type "CadetBlue"
         And I press "RET"
         Then et-curr-color should be "CadetBlue"
           Assertion failed: (equal et-curr-color color)
     
     1 scenarios (1 failed, 0 passed)
     5 steps (1 failed, 0 skipped, 4 passed)

