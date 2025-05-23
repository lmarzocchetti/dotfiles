(package-initialize)
(setq custom-file "~/.emacs.custom.el")

(load-file "~/.emacs.rc/rc.el")
(load-file "~/.emacs.rc/misc-rc.el")
(load-file "~/.emacs.rc/custom-functions.el")

;(add-to-list 'default-frame-alist `(font . "Iosevka-20"))
(add-to-list 'default-frame-alist `(font . "Iosevka Nerd Font-20"))

;(rc/require-theme 'gruber-darker)
;(rc/require-theme 'catppuccin)
;(rc/require-theme 'zenburn)
(rc/require-theme 'monokai)
;;(use-package kaolin-themes
;;  :config
;;  (load-theme 'kaolin-temple t)
;;  (kaolin-treemacs-theme))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(ido-mode 1)
(ido-everywhere 1)
(global-display-line-numbers-mode 1)
(electric-pair-mode 1)
(setq ring-bell-function 'ignore)
(font-lock-mode)

(if (eq system-type 'darwin)
  (progn
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'super)))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(setq c-default-style "linux"
      c-basic-offset 4)

(setq clang-format-style-option "linux")

(if (eq system-type 'gnu/linux)
    (setq lsp-clangd-binary-path "/usr/bin/clangd")
    (setq lsp-clangd-binary-path "/opt/homebrew/opt/llvm/bin/clangd"))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-inlay-hint-enable t)
  :hook (
         (haskell-mode . lsp-deferred)
         (cmake-ts-mode . lsp-deferred)
         (zig-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(use-package dap-mode)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      lsp-idle-delay 0.1)

(use-package which-key
  :config
  (which-key-mode))

(rc/require 'company)

(rc/require 'multiple-cursors)

(rc/require 'magit)

(rc/require 'drag-stuff)
(drag-stuff-global-mode)
(drag-stuff-define-keys)

(rc/require 'winum)
(winum-mode)

(defvar treesit-language-source-alist
  '(
    (odin "https://github.com/tree-sitter-grammars/tree-sitter-odin")
    (cmake "https://github.com/uyha/tree-sitter-cmake")
   ))

;; Common Lisp
(rc/require 'sly)
(setq inferior-list-program "/usr/bin/sbcl")
(setq sly-complete-symbol-function 'sly-flex-completions)
(add-hook 'sly-mrepl-mode-hook 'company-mode)
(add-hook 'lisp-mode-hook 'company-mode)

;; Zig
(rc/require 'zig-mode)
(setq lsp-zig-zls-executable "~/.zig/zls")
(setq lsp-zig-highlight-global-var-declarations t)
(font-lock-add-keywords 'zig-mode
 `((,(concat
   "\\<[_a-zA-Z][_a-zA-Z0-9]*\\>"       ; Object identifier
   "\\s *"                              ; Optional white space
   "\\(?:\\.\\|->\\)"                   ; Member access
   "\\s *"                              ; Optional white space
   "\\<\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\>" ; Member identifier
   "\\s *"                              ; Optional white space
   "(")                                 ; Paren for method invocation
   1 'font-lock-function-name-face t)))
(if (>= emacs-major-version 28)
    (add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
  (progn
    (defun colorize-compilation-buffer ()
      (let ((inhibit-read-only t))
        (ansi-color-apply-on-region compilation-filter-start (point))))
    (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)))

;; Ocaml
(use-package tuareg
  :ensure t
  :hook (tuareg-mode . lsp-deferred))

(use-package dune
  :ensure t)

(use-package merlin
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook #'merlin-mode)
  (add-hook 'merlin-mode-hook #'company-mode)
  (setq merlin-error-after-save nil))

(use-package merlin-eldoc
  :ensure t
  :hook ((tuareg-mode) . merlin-eldoc-setup))

(use-package flycheck-ocaml
  :ensure t
  :config
  (flycheck-ocaml-setup))

;; Haskell
(use-package haskell-mode
  :hook ((haskell-mode . interactive-haskell-mode)))

(use-package lsp-haskell
  :after lsp-mode
  :config
  (setq lsp-haskell-server-path "haskell-language-server-wrapper"))

;; Odin
(load-file "~/.emacs.rc/odin-ts-mode.el")
(add-to-list 'auto-mode-alist '("\\.odin\\'" . odin-ts-mode))
;; Set up OLS as the language server for Odin, ensuring lsp-mode is loaded first
(with-eval-after-load 'lsp-mode
  (setq-default lsp-auto-guess-root t) ;; Helps find the ols.json file with Projectile or project.el
  (add-to-list 'lsp-language-id-configuration '(odin-ts-mode . "odin"))

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "~/.ols/ols") ;; Adjust the path here
                    :major-modes '(odin-mode odin-ts-mode)
                    :server-id 'ols
                    :multi-root t))) ;; Ensures lsp-mode sends "workspaceFolders" to the server

;; Add a hook to autostart OLS
(add-hook 'odin-ts-mode-hook #'lsp-deferred) ;; If you're using the TS mode

(add-to-list 'compilation-error-regexp-alist-alist
             '(odin
               "^\\([^()\t\n]+\\)(\\([0-9]+\\):\\([0-9]+\\)) \\(?:Error\\|Note\\|Warning\\):"
               1 2 3))

(add-to-list 'compilation-error-regexp-alist 'odin)

;; smex
(rc/require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-,") 'rc/duplicate-line)
(global-set-key (kbd "C-c C-f") 'generate-clang-format-file)

;; gruber-darker-theme which-key lsp-mode lsp-ui flycheck company company-mode lsp-treemacs rust-mode dap-mode multiple-cursors smex winum kaolin-themes drag-stuff zig-mode
