(defun generate-clang-format-file ()
  (interactive)
  (let* ((cur-dir default-directory)
         (command-to-launch (concat "clang-format -style='{BasedOnStyle: Microsoft, IndentWidth: 4, IndentCaseLabels: true, BreakBeforeBraces: Linux, InsertBraces: true}' -dump-config > " default-directory ".clang-format")))
    (shell-command command-to-launch)))

