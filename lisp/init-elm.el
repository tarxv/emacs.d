(when (maybe-require-package 'elm-mode)
  (setq-default elm-format-on-save t)
  (after-load 'elm-mode
    (diminish 'elm-indent-mode)
    (when (executable-find "elm-oracle")
      (add-hook 'elm-mode-hook 'elm-oracle-setup-completion))
    (when (executable-find "elm-format")
      (setq-default elm-format-on-save t)))
  (when (maybe-require-package 'flycheck-elm)
    (after-load 'elm-mode
      (flycheck-elm-setup))))

(provide 'init-elm)
