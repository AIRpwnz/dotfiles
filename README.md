# Dotfiles

Personal macOS dotfiles kept under version control for quick onboarding via chezmoi.

## Using chezmoi

1. **Bootstrap a machine** (clone + apply in one shot):
   ```bash
   chezmoi init --apply <repo-url>
   ```
2. **Reapply after local edits** so the working copy and real files stay aligned:
   ```bash
   chezmoi apply
   ```
3. **Update an existing machine** when changes are pushed to the repo:
   ```bash
   chezmoi update --apply
   ```

Replace `<repo-url>` with your own HTTPS/SSH remote.
