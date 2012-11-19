
(defvar et-curr-color 
  nil
  "Last color chosen from completing prompt")

(defun et-choose-color ()
  "Simple example using completing"
  (interactive)
  (let ((color (completing-read "Choose Color: " (et-get-unique-color-keys) nil t)))
    (message (format "You chose: %s!" color))
    (setq et-curr-color color)))

(defun et-get-unique-color-keys ()
  "Get's a list of unique list of color names"
  (mapcar (lambda (color) (car color)) (et-get-color-aliases)))

(defun et-get-color-aliases ()
  "Get a list of possible colors for this frame. List of list of color aliases. Copied from list-colors-display"
  (setq list (mapcar
              'car
              (sort (delq nil (mapcar
                               (lambda (c)
                                 (let ((key (list-colors-sort-key
                                             (car c))))
                                   (when key
                                     (cons c (if (consp key) key
                                               (list key))))))
                               (list-colors-duplicates (defined-colors))))
                    (lambda (a b)
                      (let* ((a-keys (cdr a))
                             (b-keys (cdr b))
                             (a-key (car a-keys))
                             (b-key (car b-keys)))
                        ;; Skip common keys at the beginning of key lists.
                        (while (and a-key b-key (equal a-key b-key))
                          (setq a-keys (cdr a-keys) a-key (car a-keys)
                                b-keys (cdr b-keys) b-key (car b-keys)))
                        (cond
                         ((and (numberp a-key) (numberp b-key))
                          (< a-key b-key))
                         ((and (stringp a-key) (stringp b-key))
                          (string< a-key b-key)))))))))

(provide 'ecukes-test)
