## ⛓️ Конфликты слияния в Git
Обычно конфликты возникают, когда два человека изменяют одни и те же строки
в файле или один разработчик удаляет файл, который в это время изменяет
другой разработчик. В таких случаях Git не может автоматически определить, 
какое изменение является правильным. Конфликты затрагивают только того разработчика,
который выполняет слияние, остальная часть команды о конфликте не знает. 
Git помечает файл как конфликтующий и останавливает процесс слияния. 
В этом случае ответственность за разрешение конфликта несут разработчики.

### 🩺 Разрешение конфликтов слияния в Git
1) Перейдите в проект.
2) Удостоверьтесь в том, что находитесь именно на той ветке, в которую хотите выполнить
слияния. Обычно сливаются ветвь удаленного отслеживания (т. е. ветвь, полученная из удаленного репозитория)
и локальная ветвь.

Для определения текущей рабочей ветки рекомендую использовать `git branch` или же `git status`.

Результат выполнения `git branch`:
```textmate
* dockerfile_branch
  main
```

Результат выполнения `git status`:
```text
On branch dockerfile_branch
Your branch is up to date with 'origin/dockerfile_branch'.
```

3) Выполните команду: `git pull REMOTE-NAME BRANCH-NAME`.
В моем случае это выглядит следующим образом:
```textmate
git pull origin main
```
> Напомню, что `git pull` — это удобное сочетание клавиш 
> для выполнения `git fetch` и `git merge` в одной команде.

Если имеются конфликты, то они отобразятся.
```text
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
```
4) Выполните команду `git status`, для того чтобы 
отобразить список файлов, затронутых конфликтом. 
В моем примере файл `README.md` имеет конфликт слияния.
```text
$ git status
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Changes to be committed:
        new file:   assets/sql-database-icon.png

Unmerged paths:
  (use "git add <file>..." to mark resolution)
        both modified:   README.md
```
5) Просмотрим содержимое файла `README.md`, используя команду `cat`.
```bash
$ cat README.md
```
Видно, что в файле появились новые странные дополнения:
* `<<<<<<< HEAD`
* `=======`
* `>>>>>>> 116af16aae92`

Строка `=======` является «центром» конфликта.  
Все содержимое между этим центром и строкой `<<<<<<< HEAD` находится 
в текущей ветке `main`, на которую ссылается указатель HEAD. 
А все содержимое между центром и строкой `>>>>>>> 116af16aae92` 
является содержимым ветки для слияния.

6) Самый простой способ разрешить конфликт — отредактировать конфликтующий файл. 
Открываем файл `README.md` в привычном редакторе. Например, `nano README.md`.
В моем примере нужно просто удалить все разделители конфликта.
7) После редактирования файла выполняем 
команду `git add README.md`, чтобы добавить новое объединенное содержимое 
в раздел проиндексированных файлов.
8) Для завершения слияния создаем новый коммит, выполнив следующую команду:
```textmate
git commit -m "merged and resolved the conflict in README.md"
```
Готово!
Git обнаружит, что конфликт разрешен, и создаст новый коммит слияния 
для завершения процедуры слияния.

### 🔮 Полезные источники
1. [Документация GitHub](https://docs.github.com/ru/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts/resolving-a-merge-conflict-using-the-command-line?platform=windows)
2. [Документация Atlassian](https://www.atlassian.com/ru/git/tutorials/using-branches/merge-conflicts?ysclid=mmqc2n5mgv670709880)