

(defun xt3/speak ()
  "使用 Mac OS X 语音合成器朗读"
  (interactive)
  (let (text)
    (setq text
          (if (use-region-p)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'word)))
    (shell-command (format "say '%s'" text))
    ))


(defun xt3/sel-cur-line ()
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position))
  )

(defun xt3/new-empty-buffer ()
  "Open a new empty buffer."
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (message "xt3/new-empty-buffer")
    (funcall (and initial-major-mode))
    (setq buffer-offer-save t)))

(define-key global-map (kbd "C-c 1") 'xt3/new-empty-buffer)



