;;; keybindings.el --- Custom key bindings -*- lexical-binding: t; -*-

(defun kill-current-buffer ()
  "Kill the current buffer without prompting."
  (interactive)
  (kill-buffer (current-buffer)))

(defun save-and-kill-buffer ()
  "Save the current buffer and then kill it, unless it's an indirect buffer."
  (interactive)
  (if (bound-and-true-p org-capture-mode)
      ;; If this is an indirect buffer, use default C-c C-k behavior
      (org-capture-kill)
    ;; Otherwise, save and kill as usual
    (when (buffer-modified-p)
      (save-buffer))
    (kill-buffer (current-buffer))))

;; Custom key bindings
(global-set-key (kbd "C-c k") 'kill-current-buffer)
(global-set-key (kbd "C-c C-k") 'save-and-kill-buffer)

;;; keybindings.el ends here