;; windows: dumpbin /exports <file.dll>                  ;; dump all functions in dll or exe
;; windows: dumpbin /symbols <file>
;; windows: dumpbin /ARCHIVEMEMBERS <file.lib>           ;; dump list of all object files in static library
;; windows: dumpbin /imports <foo.exe> | msvcfilt | less ;; complex example to demangle all symbols
;; windows: lib.exe /list <file.lib>                     ;; dump list of all object files in static library
;; unix:    ar t <libfile.a>
;;
;;

(defgroup elf-pe-mode nil
  "Major mode for viewing iported/exported symbols in binary files with PE or ELF format."
  :group 'emacs)

;;;###autoload
(defun elf-pe-mode ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (insert (shell-command-to-string (format "readelf --syms -W %s" (buffer-file-name))))
    (set-buffer-modified-p nil)
    (read-only-mode 1)
    ))
