
(let* ((features-directory
        (file-name-directory
         (directory-file-name (file-name-directory load-file-name))))
       (project-directory
        (file-name-directory
         (directory-file-name features-directory))))
  (setq ecukes-test-root-path project-directory))

(add-to-list 'load-path ecukes-test-root-path)
(require 'ecukes-test)
(require 'espuds)

(Setup
 ;; Before anything has run
 )

(Before
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )
