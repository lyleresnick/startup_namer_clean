# startup_namer_clean_clean

This app generates proposals for StartUp names. 

This should sound familiar, as this code is a refactor of the app which is produced when you follow [Flutter CodeLabs part 1 & 2](https://flutter.dev/docs/codelabs). This refactor uses an implementation of the Clean architecture implemented with BLoCs.

You can find the original solution [here](https://github.com/flutter/codelabs/blob/codelab/startup_namer/step8_themes/lib/main.dart).

There are 2 branches: `master` and `without_router`. 

The `without_router` branch does not use a router. 

The `master` branch refactors the repository to deliver Domain Entities with ids and shows how those ids are used to translate selection indexes to ids. 

