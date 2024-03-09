# Instructions
This uses `typst` to create a resume.
The nix flake loads the needed environment, and direnv does that automatically.
Without direnv, enter the environment manually with `nix develop`.
Without nix shells enabled just load a new shell with typst like this `nix-shell -p typst`.
Without nix, just refer to [the github repo](https://github.com/typst/typst) for installation instructions.

To develop use `typst watch resume.typ`

To compile into `resume.pdf` use `typst compile resume.typ`

To have `vscode` do that for you just use Shift+Command-P to open the control panel and use `Typist preview: Preview current file` having the Typist Preview extension installed, but note that the preview doesn't actually match the output layout always, so it's better to use the watch method.
