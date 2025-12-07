;;; general.el --- General configurations -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration,
;; email clients, file templates and snippets. It is optional.
(setq user-full-name "Kaidong Hu"
      user-mail-address "hukaidonghkd@gmail.com")

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;;; general.el ends here
