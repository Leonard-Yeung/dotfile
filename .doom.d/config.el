;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(server-start)
(setq user-full-name "Leonard Yeung"
      user-mail-address "leonardyeung0503@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Hack" :size 14 :weight 'Regular))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-pro)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-minimum-length 1)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)
(setq company-tooltip-idle-delay 0.3)
(setq company-tooltip-align-annotations t)
(setq company-tooltip-margin 2)
(setq company-dabbrev-ignore-case t)
(setq company-dabbrev-other-buffers t)
(setq org-directory "~/org/")
(after! projectile
    (setq projectile-project-root-files-bottom-up
        (remove ".git" projectile-project-root-files-bottom-up)))
(setq solidity-solc-path "/usr/bin/solc")
(setq solidity-solium-path "/home/leonard/.config/yarn/global/node_modules/.bin/solium")
(setq solidity-comment-style 'slash)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(setq prettier-js-args '(
  "--trailing-comma" "all"
  "--bracket-spacing" "false"
))
(setq solidity-flycheck-solc-checker-active t)
(setq solidity-flycheck-solium-checker-active t)
(setq flycheck-solidity-solc-addstd-contracts t)
(+global-word-wrap-mode +1)
(setq clang-format-style-option "llvm")
(add-hook 'solidity-mode-hook
	(lambda ()
	(set (make-local-variable 'company-backends)
		(append '((company-solidity company-capf company-dabbrev-code))
			company-backends))))
(after! js2-mode
  (set-company-backend! 'js2-mode 'company-tide 'company-yasnippet))
(setq display-time-mode 1)
(setq lsp-log-io nil)
(setq lsp-ui-doc-header t)
(setq lsp-ui-doc-include-signature t)
(setq lsp-ui-doc-delay 1)
(setq lsp-ui-doc-show-with-cursor 1)
(setq lsp-ui-doc-border (face-foreground 'default))
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-ignore-duplicate t)
(setq lsp-ui-sideline-show-code-actions nil)
(setq lsp-diagnostic-clean-after-change t)
(beacon-mode 1)
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-buffer-modification-icon t)
(setq doom-modeline-buffer-name t)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-indent-info t)
(setq doom-modeline-workspace-name t)
(setq doom-modeline-lsp t)
(setq doom-modeline-modal-icon t)
(setq doom-modeline-env-version t)
;;(setq yas-snippet-dirs "/Users/leonardyeung/.emacs.d/.local/straight/repos/snippets")
(setq +treemacs-git-mode 'deferred)
(setq flycheck-check-syntax-automatically '(save mode-enable))
(setq dimmer-mode t)
(setq dimmer-fraction 0.3)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
