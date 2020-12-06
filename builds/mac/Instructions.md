# Mac Installation Instructions

### You may run into an error telling you that ""App" is damaged and can't be opened. You should move it to the trash". If you do, these steps should resolve the problem.

1. Download `Client.zip` and `Server.zip`.
2. Double click each one to open them. This should make the app icon appear.
3. Open Terminal (I promise this won't be super involved).
4. Copy & paste in this command, including the space at the end but without the quotes: `"xattr -d com.apple.quarantine "`
5. Drag & drop the app icon made by opening `Client.zip` into Terminal.
6. Run the command by pressing return.
7. Repeat steps 4 - 6 for `Server.zip` as well.
8. Run the server app, and then the client app.
9. Enjoy Together!