<p align="center"><img src="https://cdn.rawgit.com/arcticicestudio/nord-visual-studio-code/develop/assets/nord-visual-studio-code-banner.png" srcset="https://cdn.rawgit.com/arcticicestudio/nord-visual-studio-code/develop/assets/nord-visual-studio-code-banner-2x.png 2x"/></p>

<p align="center"><img src="https://assets-cdn.github.com/favicon.ico" width=24 height=24/> <a href="https://github.com/arcticicestudio/nord-visual-studio-code/releases/latest"><img src="https://img.shields.io/github/release/arcticicestudio/nord-visual-studio-code.svg?style=flat-square"/></a> <a href="https://github.com/arcticicestudio/nord/releases/tag/v0.2.0"><img src="https://img.shields.io/badge/Nord-v0.2.0-88C0D0.svg?style=flat-square"/></a> <img src="https://marketplace.visualstudio.com/favicon.ico" width=24 height=24/> <a href="https://code.visualstudio.com/updates/v1_12"><img src="https://img.shields.io/badge/VS_Code-v1.12+-373277.svg?style=flat-square"/></a> <a href="https://marketplace.visualstudio.com/items/arcticicestudio.nord-visual-studio-code"><img src="https://vsmarketplacebadge.apphb.com/version/arcticicestudio.nord-visual-studio-code.svg?style=flat-square"/></a> <a href="https://marketplace.visualstudio.com/items/arcticicestudio.nord-visual-studio-code"><img src="https://vsmarketplacebadge.apphb.com/installs/arcticicestudio.nord-visual-studio-code.svg?style=flat-square"/></a> <a href="https://marketplace.visualstudio.com/items/arcticicestudio.nord-visual-studio-code"><img src="https://vsmarketplacebadge.apphb.com/rating-short/arcticicestudio.nord-visual-studio-code.svg?style=flat-square"/></a></p>

![Release Date: 2019-05-26](https://img.shields.io/badge/Release_Date-2019--05--26-88C0D0.svg?style=flat-square) [![Project Board](https://img.shields.io/badge/Project_Board-0.9.0-88C0D0.svg?style=flat-square)](https://github.com/arcticicestudio/nord-visual-studio-code/projects/17) [![Milestone](https://img.shields.io/badge/Milestone-0.9.0-88C0D0.svg?style=flat-square)](https://github.com/arcticicestudio/nord-visual-studio-code/milestone/14)

# Bug Fixes

**VSCE artifact build due to restricted SVG image policy** — #137 (⊶ 97d8b7ee)
↠ Due to the [restricted security policy of the `vsce` packaging and publishing tool][vscode-docs-vsce-pubext] the previously used SVG images in the `CHANGELOG.md` have been removed in order to fix the build process.

<!--
+------------------+
+ Symbol Reference +
+------------------+
↠ (U+21A0): Start of a log section description
— (U+2014): Separator between a log section title and the metadata
⇄ (U+21C4): Separator between a issue ID and pull request ID in a log metadata
⊶ (U+22B6): Icon prefix for the short commit SHA checksum in a log metadata
-->

[vscode-docs-vsce-pubext]: https://code.visualstudio.com/api/working-with-extensions/publishing-extension#publishing-extensions
