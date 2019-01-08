# Tick Version  

Take the current NPM version in your project's `package.json` and apply a new patch version.

Ex: `1.2.0` to `1.2.1`

**Requirements**
* Github Application Token

**Requirements on your Wercker Box**
* Git
* NPM


#### Creating a GitHub token
To be able to use this step, you will first need to create a GitHub token with an account which has enough permissions to be able to create releases. First goto `Account settings`, then goto `Developer Settings` for the user. Here you can create a token in the `Personal access tokens` section. For a private repository you will need the `repo` scope and for a public repository you will need the `public_repo` scope. Then it is recommended to save this token on wercker as a protected environment variable.

# Usage

```
- mobilemedtek/tick-version:
    token: [GITHUB APPLICATIONS TOKEN]
```

# Example

```
- mobilemedtek/tick-version:
    token: z3d4cc32637d4eb8d2c5908352q8baa121d8993d
```

# Changelog

## 0.0.6

- Removed need for GPG key

## 0.0.3

- Fixed bash condition bug

## 0.0.2

- Initial Commit
