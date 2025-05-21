# Flutter HTTP Kata

A kata designed to introduce installation of packages, using `Future` and the usage of the HTTP package.

Prior knowledge requirements:
- Basic widgets like `Column`, `Row`, `Text`, `Buttons`

## Getting Started

The goals of this Kata is to reproduce below screenshots

![UI to reproduce](assets/ui-to-reproduce.png?raw=true)

![UI to reproduce](assets/loading-state.png?raw=true)

Specs:
- Clicking on the `FilledButton` should call `https://fakeresponder.com/?sleep=3000`
- While loading, a `CircularProgressIndicator` should replace the text
- When call completes, text should be replaced by `Done!`

Challenges:
- Disable the `FilledButton` when it's loading
- Add a checkbox that will toggle if the response returns 200 or 500 (hint: `?status=500`)
- When call completes, text should display the status code if it failed

![Error checkbox](assets/error-checkbox.png?raw=true)

![Error message](assets/error-message.png?raw=true)
