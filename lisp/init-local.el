;;; package --- Summary
;;; Commentary:
;;; Code:

;; (setq-default auto-fill-function 'do-auto-fill)
(setq default-directory "/home/liren/Documents" )
(global-set-key (kbd "C-x t") '(lambda ()  (interactive) (shell-command "gnome-terminal")))

;; f12 for quick ansi-term access (cannot handle hanging process.)
(global-set-key (kbd "<f12>")
                '(lambda () (interactive)
                   (if (get-process "*ansi-term*")
                       (progn (delete-process "*ansi-term*")
                              (if (get-buffer-window "*ansi-term*") (delete-window (get-buffer-window "*ansi-term*")) nil)
                              (kill-buffer "*ansi-term*"))
                     (progn (ansi-term "/bin/zsh")
                            (if (< (window-width) 100)
                                (progn (split-window-below) (previous-buffer) (windmove-down))
                              (progn (split-window-right) (previous-buffer) (windmove-right)))))))

;; org with visual-line
(add-hook 'org-mode-hook 'visual-line-mode)

(defun doc ()
  "Dired /usr/share/doc."
  (interactive) (dired "/usr/share/doc"))
(defun src ()
  (interactive) (dired "~/src/"))

(setq ac-auto-start 5)
(setq ac-auto-show-menu nil)
(setq blink-cursor-mode nil)
(setq cua-enable-cua-keys t)
(setq desktop-save-mode nil)
(setq-default fill-column 80)
(setq flycheck-gcc-language-standard "c11")
(setq flycheck-python-pycompile-executable "python3")
(setq org-src-fontify-natively t)
(setq org-src-preserve-indentation t)
(setq org-src-window-setup (quote other-frame))
(setq org-src-tab-acts-natively t)
(setq python-shell-interpreter "python3")
(setq-default show-trailing-whitespace nil)
(menu-bar-mode -1)
(setq org-clock-persist nil)
(setq electric-pair-preserve-balance nil) ; make java pairs acting normal after generics(<K>)

(require 'saveplace) ;; using setq will not do because the variable is buffer-local.
(setq-default save-place t)

;;(autoload 'dired-async-mode "dired-async.el" nil t)
;;(dired-async-mode 1)

(global-hl-line-mode 1)
(add-to-list 'auto-mode-alist '("\\zsh\\'" . sh-mode))
(setq org-hide-emphasis-markers nil)


(provide 'init-local)

;;; init-local.el ends here


