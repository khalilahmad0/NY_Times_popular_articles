<p align="center">
  <a href="https://www.nytimes.com/">
    <img src="https://github.com/khalilahmad0/NY_Times_popular_articles/tree/main/screenshots/logo.png" alt="Logo" width=72 height=72>
  </a>

  <h3 align="center">NY Times Most Popular Articles</h3>

  <p align="center">
    NY Times mobile app that gets the most popular articles.
    <br>
    <br>
    <a href="https://github.com/khalilahmad0/NY_Times_popular_articles/issues/new">Report bug</a>
    ·
    <a href="https://github.com/khalilahmad0/NY_Times_popular_articles/issues/new">Request feature</a>
  </p>
</p>

## Table of contents

- [Quick start](#quick-start)
- [What's included](#whats-included)
- [NY Times API](#NY-Times-API)
- [Development Environment](#development-environment)
- [SonarQube](#SonarQube)
- [Github Actions](#Github-Actions)
- [App Screenshots](#App-Screenshots)
- [Bugs and feature requests](#bugs-and-feature-requests)

## Quick start

This is a normal flutter app. You should follow the instructions in the [official documentation](https://flutter.io/docs/get-started/install) to download Flutter. After you have successfully downloaded it, follow these instructions to run the app:

* Clone the repo using `git clone https://github.com/khalilahmad0/NY_Times_popular_articles.git`
* Run `flutter pub get` in the project directory
* Replace `apiKey` in `lib/utils/api.dart` with your own NY Times API Key. For more info on how to generate your key, please follow [NY Times developer's documentation](https://developer.nytimes.com/get-started).
* Run the app with `flutter run`
##### Optional
* To run the static code analysis, use `flutter analyze`
* To run the unit tests, use `flutter test`
* To build the APK, use `flutter build apk`

## What's included

* Master/detail app
* Articles listing
* Articles display
* Responsive layout
* Static code analysis
* Unit tests including code coverage
* Integration tests
* CI with Github Actions
* Following the [best practices](https://docs.flutter.dev/perf/rendering/best-practices)!


### NY Times API

This repo is using NY Times Most Popular Articles API. [More info here](https://developer.nytimes.com/get-started).

## Development Environment
The app was developed using:
* Flutter 2.5.2 - channel stable
* Dart 2.14.3
* Android Studio Arctic Fox | 2020.3.1 Patch 2

The app was tested on:
* Emulator: Pixel 5 API 29
* Android Physical Device: Samsung S21 Ultra


## SonarQube
SonarQube was used for code quality analysis. To run it:
* If you have SonarQube installed, just run `sonar-scanner` after ensuring that SonarQube is running.
* If you don't have SonarQube installed, please follow this [detailed tutorial](https://dev.to/jamescardona11/flutter-code-static-analysis-with-sonarqube-3b39).

##### My report:
![report](screenshots/sonarqube-report.png?raw=true)

### Github Actions

I'm using Github Actions CI to run these tasks in order (It is triggered on every push or PR to `main`):
* Running static code analysis (default `flutter_linter`)
* Running unit tests
* Build for production
* Save Artifact as a GitHub release

You can find the actions under `.github/workflows/build.yml`

### App Screenshots
![article-list](screenshots/article-list.jpg?raw=true)
![article-detail](screenshots/article-detail.jpg?raw=true)


## Bugs and feature requests

Have a bug or a feature request? Please first search for existing and closed issues. If your problem or idea is not addressed yet, [please open a new issue](https://github.com/khalilahmad0/NY_Times_popular_articles/issues/new).



Enjoy :metal:
