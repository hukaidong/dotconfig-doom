;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Load modular configuration files
(load! "comments")
(load! "general")
(load! "font-config")
(load! "org-config")
(load! "keybindings")
(load! "mail-config")

;;; Bibliography paths
(after! bibtex-completion
  (setq bibtex-completion-bibliography '("~/.config/references.bib")
        bibtex-completion-library-path '("~/papers/")
        bibtex-completion-notes-path "~/org/roam/refs/"
        
        ;; Use org-cite format when inserting citations in org files
        bibtex-completion-format-citation-functions
        '((org-mode . bibtex-completion-format-citation-org-cite)
          (latex-mode . bibtex-completion-format-citation-cite)
          (default . bibtex-completion-format-citation-default))
        
        ;; Template for literature notes (one file per entry)
        bibtex-completion-notes-template-multiple-files
        (concat "#+title: ${title}\n"
                "#+filetags: :reference:\n\n"
                "* ${title}\n"
                ":PROPERTIES:\n"
                ":ROAM_REFS: [cite:@${=key=}]\n"
                ":AUTHOR: ${author-or-editor}\n"
                ":YEAR: ${year}\n"
                ":END:\n\n"
                "** Summary\n\n"
                "** Notes\n\n")))

;;; Configure bibtex autokey format: author + year + first title word
;;; Example output: smith2023deep, jones2024reinforcement
(after! bibtex
  (setq bibtex-autokey-year-length 4                    ; use full year: 2023
        bibtex-autokey-name-year-separator ""           ; no separator between name and year
        bibtex-autokey-year-title-separator ""          ; no separator between year and title
        bibtex-autokey-titleword-separator ""           ; no separator between title words
        bibtex-autokey-titlewords 1                     ; use 1 word from title
        bibtex-autokey-titlewords-stretch 0             ; don't add extra words
        bibtex-autokey-titleword-length nil             ; use full word (nil = no limit)
        bibtex-autokey-titleword-ignore                 ; words to skip
        '("A" "An" "On" "The" "A" "For" "And" "Of" "In" "To"
          "a" "an" "on" "the" "for" "and" "of" "in" "to")))

;;; Org-cite configuration
(after! oc
  (setq org-cite-global-bibliography '("~/.config/references.bib")
        org-cite-export-processors '((latex biblatex)
                                     (t csl))))

;;; For faster CrossRef responses
(after! biblio
  (setq biblio-crossref-user-email-address "hukaidong@gmail.com"))
  

;;; Org-roam-bibtex integration
(use-package! org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (setq orb-preformat-keywords '("citekey" "title" "author-or-editor" "year" "url" "file")
        orb-process-file-keyword t
        orb-attached-file-extensions '("pdf" "epub")))
