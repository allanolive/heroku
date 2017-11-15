[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Rails Deployment with Heroku

You've learned a lot about how to build a Rails application over the last few
weeks. Now let's 'go public' and share our apps with the world!

## Prerequisites

-   [rails-api](https://git.generalassemb.ly/ga-wdi-boston/rails-api)
-   [rails-activerecord-crud](https://git.generalassemb.ly/ga-wdi-boston/rails-activerecord-crud)
-   This guide assumes you have followed [these installation instructions](https://git.generalassemb.ly/ga-wdi-boston/rails-api-template#installation) unequivocally.

## Objectives

-   Create a repository on github for your project.
-   Create a Heroku app from the command line.
-   Push the latest code to Heroku.
-   Migrate the production database.
-   Grab the link to your deployed API and paste it into the api_url.txt file.
- Open a Pull Request to the GA repo so that we may check your API link.

## Getting Set Up

Before you can begin deploying your applications to Heroku, there are some
things you'll need to do first.

1.  **Create a github repository for your project**, at [Create a repo](https://help.github.com/articles/create-a-repo/).
1.  **Create a Heroku account**, at [Create a Heroku Account](https://www.heroku.com).
    You will be sent an activation email, so be sure to check your inbox so that
    you can activate your account.
1.  Install the Heroku Command Line Tools: run `brew install heroku`.
1.  **Log into Heroku** by running `heroku login` from the console and providing
    your Heroku credentials when asked. Once you log in, if you're prompted
    to add these credentials to your keychain, say yes. *You will not be able*
    *to see your password*

## Deploying to Heroku: Checklist

Now you're set up to use Heroku. To deploy a new application
to Heroku:

-   [ ] Run `heroku create` in the command line in the root of your Rails API to
    create a new (blank) app on Heroku.
-   [ ] Push your latest code to Heroku (`git push heroku master`)
-   [ ] Update your heroku database by telling Heroku to run your migration files (`heroku run rake db:migrate`).
    If you have any other rake tasks that need to run (e.g. `rake db:seed`), run
    those with `heroku run` as well.
-   [ ] Set your secrets. (Either by using the [command line](#set-your-secrets) or by using the
heroku app panel in your browser)
-   [ ] Check your work by restarting heroku and opening your heroku application.

Let's look at each of these steps in detail.

### Create a New Heroku App

Go to the root of your repo and run `heroku create`. This will create an
_autogenerated_ name for your app, and add a new remote repository to your repo
 called _heroku_. View your remotes by typing `git remote -v`. You should see
something like:

```sh
    heroku  git@heroku.com:agile-badlands-7658.git (fetch)
    heroku  git@heroku.com:agile-badlands-7658.git (push)
    origin  git@github.com:tdyer/wdi_4_rails_hw_tdd_hacker_news.git (fetch)
    origin  git@github.com:tdyer/wdi_4_rails_hw_tdd_hacker_news.git (push)
```

### Push `master` to Heroku

Only keep clean, working code on `master`. After you complete a feature merge it
onto `master`. Push your updated `master` to GitHub, then to Heroku.

```sh
git checkout master
git merge my-feature # merge your working code
git push origin master # update GitHub
git push heroku master # update heroku
```

### Update Heroku's Database

Once you've deployed your code, you can safely run new migrations. You'll need
to do this step every time you have new migrations.

```sh
heroku run rake db:migrate
```

If you have seeds or examples, or if you've updated seeds or examples, you
should also run them on heroku.

```sh
heroku run rake db:seed
heroku run rake db:examples
```

### Set your Secrets

Set your environmental variables in your heroku app.

```sh
heroku config:set SECRET_KEY_BASE=$(rake secret)
```

```sh
heroku config:set SECRET_TOKEN=$(rake secret)
```

```sh
heroku config:set CLIENT_ORIGIN=https://yourgithubname.github.io
```

### Check Your Work

Restart your application and check it out in the browser.

```sh
heroku restart
heroku open
```

You'll probably see something like this:

<img width="599" alt="herokuapp_png_1_366x768_pixels" src="https://cloud.githubusercontent.com/assets/388761/13259005/93c9fdf6-da23-11e5-9c90-19c59580944a.png">

That's normal, **unless** you have defined a root route.

### Change Your App's Name (optional)

If you wish you can rename your app at any time. It must be unique across all
apps deployed to heroku.

```sh
heroku apps:rename newname
```

Your app will become immediately available at it's new subdomain,
`newname.herokuapp.com`.

### Share Your App **(REQUIRED)**

1. Open an issue on this repository [here](https://git.generalassemb.ly/ga-wdi-boston/rails-heroku-setup-guide/issues/new)
1. Include the deployed URL of your heroku app in the description.

## Heroku Command Reference

A full list of Heroku commands can be access by running `heroku --help`; below
are some of the more common ones.

|                Commands                |                                                 Behavior                                                 |
| -------------------------------------- | -------------------------------------------------------------------------------------------------------- |
|             `heroku logs [--tail]`              |                                   Running just `heroku logs` will show you the server logs from your deployed API. The `--tail` flag is optional.                        |
|            `heroku run ...`            |                                    Run a program from within Heroku. Examples (`heroku run rails console`, `heroku run rake db:migrate`).                                     |
|            `heroku config`             |                           Environmental variables in your current Heroku app.                            |
|            `heroku config:set SECRET_KEY_BASE=$(rake secret)`            |                                    Set Secret Key.                                     |
|            `heroku config:set SECRET_TOKEN=$(rake secret)`            |                                    Set TOKEN.                                     |
|            `heroku config:set CLIENT_ORIGIN=https://yourgithubname.github.io`            |                                    Set CLIENT_ORIGIN.                                     |
|            `heroku apps:rename newname`            |                                    Rename heroku app name (entirely optional).                                     |
|            `heroku restart`            |                                    Restart the heroku app, make sure you do this after changing your API.                                     |
|            `heroku open`            |                                    Open your heroku app in default browser.                                     |
|            `heroku --help`            |                                    Displays a heroku CLI usage summary.                                     |


## WARNING: Ephemeral Filesystem.

One serious limitation of Heroku is that it provides an 'ephemeral filesystem';
in other words, if you try to save a new file inside the repo (e.g. an uploaded
image file), it will disappear when your app is restarted or redeployed.

As an example, try running the following commands:

```sh
heroku run bash
touch happy.txt; echo 'is happy' > happy.txt
cat happy.txt
```

Then, hit Ctrl-D to get out of heroku bash shell. If you re-open the shell and
run `ls -l`, `happy.txt` will be missing!

The typical workaround is to save files in cloud storage such as [Amazon
S3](https://aws.amazon.com/s3/); more on this in the near future.

![image](http://www.thehinzadventures.com/wp-content/uploads/2015/03/54843046.jpg)

## Troubleshooting

These are the commands required for deploying to heroku with rails. If your heroku deployment isn't working as expected, review these steps carefully.
- `heroku create`
- `git push heroku master`
- `heroku run rake db:migrate`
- `heroku run rake db:seed`
- `heroku config:set SECRET_KEY_BASE=$(rake secret)`
- `heroku config:set SECRET_TOKEN=$(rake secret)`
- `heroku config:set CLIENT_ORIGIN=https://yourgithubname.github.io`
- `heroku apps:rename newname` (optional)
- `heroku restart`
- `heroku open`

## Additional Resources

-   [Heroku Command Line](https://devcenter.heroku.com/categories/command-line)
-   [Heroku Rails Deployment](https://devcenter.heroku.com/articles/getting-started-with-rails5)

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
