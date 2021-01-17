;;file is loaded by Spacemacs a t startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     (typescript-local :variables
                       typescript-backend 'tide
                       typescript-fmt-tool 'prettier
                       typescript-linter 'eslint
                       typescript-fmt-on-save nil
                       )
     ;; (typescript :variables
     ;;             javascript-backend 'tide
     ;;             ;; typescript-fmt-tool 'prettier
     ;;             typescript-linter 'eslint)
     (javascript :variables
                 javascript-backend 'tide
                 javascript-fmt-tool 'prettier
                 node-add-modules-path t)
     sql
     python
     nginx
     lua
     docker
     rust
     yaml
     ;; neotree
     nlinum
     ;; osx
     ;; (colors :variables colors-enable-nyan-cat-progress-bar t)
     (colors)
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-company-help-tooltip t
                      )
     better-defaults
     ;; games
     ;; xkcd
     restclient
     emacs-lisp
     git
     github
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-shell 'multi-term
            shell-default-term-shell "/bin/bash"
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     (version-control :variables
                    version-control-diff-tool 'diff-hl
                    version-control-diff-side 'left
                    version-control-global-margin t
                    fringes-outside-margins t)
     html
     elm
     markdown
     helm
     elixir
     itome-react
     erlang
     go
     ;; floobits
     ;; gtags
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;; org-projectile
                                      kubernetes-evil
                                      resize-window
                                      doom-themes
                                      atom-one-dark-theme
                                      color-theme-sanityinc-tomorrow
                                      all-the-icons
                                      zerodark-theme
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(linum)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (setq-default
   truncate-lines t
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 10
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive nil
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         atom-one-dark
                         zerodark
                         ;; doom-tomorrow-night
                         spacemacs-dark
                         spacemacs-light
                         )
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.

   ;; dotspacemacs-default-font '("Iosevka"
   ;;                             :size 18
   ;;                             :width ultra-condensed
   ;;                             :powerline-scale 1.0)
   dotspacemacs-default-font '("PragmataPro Mono"
                               :size 18
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non-nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.

   dotspacemacs-search-tools '("ag" "rg" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  (setq package-check-signature nil)
  (setq dumb-jump-selector 'helm)
  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
  (push "~/my-emacs" load-path)
  (require 'graphql-mode)
  ;; (require 'prettier-js)
  ;;(prettier-mode)
  ;; (setq prettier-args '(
  ;;                       "--print-width" "120"
  ;;                       "--trailing-comma" "none"
  ;;                       "--bracket-spacing" "false"
  ;;                       "--single-quote" "true"
  ;;                       "--no-bracket-spacing"
  ;;                       "--jsx-bracket-same-line"
  ;;                       "--no-semi"
  ;;                       ))
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
)

(defun dotspacemacs/user-config ()
  (setq org-fontify-done-headline t)
  (setq js2-highlight-external-variables t)
  (require 'js2-highlight-vars)
  (setq dumb-jump-force-searcher 'ag)
  ;; (setq gc-cons-percentage 0.5)

  ;;; scroll one line at a time (less "jumpy" than defaults)
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  ;;end

  (setq helm-ag-use-agignore t)
  (setq helm-always-two-windows nil)
  ;; (defun my-minibuffer-setup-hook ()
  ;;   (setq gc-cons-threshold most-positive-fixnum))

  ;; (defun my-minibuffer-exit-hook ()
  ;;   (setq gc-cons-threshold 1000000))

  ;; (add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
  ;; (add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)
  ;;end

  (require 'helm-bookmark)
  ;;(require 'add-pragmatapro-symbol-keywords)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z") 'helm-select-action) ; list actions using C-z
  (define-key evil-insert-state-map (kbd "C-k") nil)
  (setq tab-always-indent t)
  ;;update buffer on file changes
  ;; (global-hl-line-mode 1)
  ;; (global-hl-line-mode -1)
  (global-auto-revert-mode 1)
  (add-hook 'dired-mode-hook 'auto-revert-mode)
  (spacemacs/toggle-highlight-current-line-globally-off)
  (spacemacs/toggle-camel-case-motion-globally-on)

  (spaceline-toggle-minor-modes-off)

  (diff-hl-flydiff-mode)

  (require 'doom-themes)
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t
        ns-use-srgb-colorspace t
        ;;doom-one-brighter-modeline t
        ;;doom-one-brighter-comments nil
        )

  ;;perf
  (setq-default
   jit-lock-defer-time nil
   ;; jit-lock-stealth-nice 0.1
   ;; jit-lock-stealth-time 0.2
   ;; jit-lock-stealth-nice 0.01
   ;; jit-lock-stealth-time 0.01
   ;; jit-lock-stealth-verbose nil
   )
  (setq-default bidi-display-reordering nil)
  (define-key evil-visual-state-map "J"
    (concat ":m '>+1" (kbd "RET") "gv=gv"))
  (define-key evil-visual-state-map "K"
    (concat ":m '<-2" (kbd "RET") "gv=gv"))

  (setq redisplay-dont-pause t)
  (global-set-key (kbd "M-m w e") 'resize-window)
  (with-eval-after-load 'resize-window
    (push '(?j ?n) resize-window-alias-list)
    (push '(?h ?f) resize-window-alias-list)
    (push '(?l ?b) resize-window-alias-list)
    (push '(?k ?p) resize-window-alias-list)
    (push '(?J ?N) resize-window-alias-list)
    (push '(?H ?F) resize-window-alias-list)
    (push '(?L ?B) resize-window-alias-list)
    (push '(?K ?P) resize-window-alias-list))

  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0)

  (load-theme 'doom-tomorrow-night t)

  ;; (let ((height (face-attribute 'default :height)))
  ;;   ;; for all linum/nlinum users
  ;;   (set-face-attribute 'linum nil :height height))

  (setq window-divider-default-places t
        window-divider-default-bottom-width 1
        window-divider-default-right-width 0)
  (window-divider-mode +1)

  (setq shell-file-name "/bin/bash")
  ;;helm speed issue
  (setq projectile-enable-caching t)

  ;; (require 'golden-ratio)
  ;; (golden-ratio-mode 1)
  (define-advice select-window (:after (window &optional no-record) golden-ratio-resize-window)
    (golden-ratio)
    nil)
  (setq whitespace-mode t)

  ;; Indentation
  ;;(spacemacs/toggle-indent-guide-globally-on)

  (setq-default js2-mode-show-parse-errors nil)
  (setq-default js2-mode-show-strict-warnings nil)
  (setq powerline-default-separator nil)

  (setq emmet-expand-jsx-className? t)
  (setq emmet-self-closing-tag-style " /")

  ;; Javascript/HTML/CSS indentati
  (setq sc-indent-offset 2)
  (setq-default
   evil-shift-width sc-indent-offset
   ;; jssc-indent-offset-mode
   jssc-indent-offset-basic-offset sc-indent-offset
   ;; json-mode
   js-indent-level sc-indent-offset
   ;; web-mode
   css-indent-offset sc-indent-offset
   web-mode-markup-indent-offset sc-indent-offset
   web-mode-css-indent-offset sc-indent-offset
   web-mode-code-indent-offset sc-indent-offset
   typescript-indent-level sc-indent-offset
   ;; web-mode-attr-indent-offset 4
   web-mode-enable-auto-quoting nil
   )

  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
    )

  (add-hook 'css-mode-hook 'my-css-mode-hook)
  ;; (add-hook 'web-mode-hook 'my-css-mode-hook)
  (add-hook 'scss-mode-hook 'my-css-mode-hook)
  (add-hook 'less-css-mode-hook 'my-css-mode-hook)
  (add-hook 'typescript-mode-hook 'emmet-mode)

  (defun my-css-mode-hook ()
    (rainbow-mode 1))

  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0.1)
  (setq flycheck-pos-tip-max-width 100)
  (setq flycheck-pos-tip-timeout 100)

  (setq ring-bell-function 'ignore)
  (defun add-snip() (yas-activate-extra-mode 'js2-mode))
  (add-hook 'typescript-mode-hook 'add-snip)

  (evil-define-key 'insert typescript-mode-map (kbd "C-f") 'company-tide)
  (evil-define-key 'insert typescript-tsx-mode-map (kbd "C-f") 'company-tide)
  (evil-define-key 'insert rust-mode-map (kbd "C-f") 'company-indent-or-complete-common)
  (with-eval-after-load 'flycheck
    (advice-add 'flycheck-eslint-config-exists-p :override (lambda() t)))

  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  )
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(magit smeargle orgit magit-svn magit-section magit-gitflow helm-gitignore helm-git-grep gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link forge ghub closql emacsql-sqlite emacsql treepy evil-magit zerodark-theme yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toml-mode toc-org tide tagedit sql-indent spaceline slim-mode shell-pop scss-mode sass-mode rjsx-mode restclient-helm restart-emacs resize-window request rainbow-mode rainbow-identifiers rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode prettier-js popwin pip-requirements persp-mode pcre2el paradox org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file ob-restclient ob-http ob-elixir nlinum-relative nginx-mode neotree mwim multi-term move-text mmm-mode markdown-toc magit-gh-pulls macrostep lua-mode lorem-ipsum livid-mode live-py-mode link-hint kubernetes-evil js2-refactor js-doc indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio go-guru go-eldoc gnuplot github-search github-clone github-browse-file git-gutter-fringe git-gutter-fringe+ gist gh-md fuzzy flycheck-rust flycheck-pos-tip flycheck-mix flycheck-elm flycheck-credo flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help erlang emmet-mode elm-mode elisp-slime-nav dumb-jump doom-themes dockerfile-mode docker diminish diff-hl define-word cython-mode company-web company-tern company-statistics company-restclient company-quickhelp company-go company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-identifiers-mode coffee-mode clean-aindent-mode cargo auto-yasnippet auto-highlight-symbol auto-compile atom-one-dark-theme alchemist aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:extend t :background "#414346")))))
