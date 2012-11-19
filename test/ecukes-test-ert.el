(let* ((project-directory
        (file-name-directory
         (directory-file-name (file-name-directory load-file-name)))))
  (add-to-list 'load-path project-directory))

(require 'ecukes-test)
(require 'ert)

(ert-deftest et-sanity-check ()
  "Ensure ert is working"
  (should (equal t t)))

(ert-deftest et-choose-color ()
  "Able to pick a color interactively"
  (et-choose-color)
  (should (equal "CadetBlue" et-curr-color)))

