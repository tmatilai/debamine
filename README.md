debamine
========

Debian EC2 AMI builder based on [ec2debian-build-ami]
(https://github.com/andsens/ec2debian-build-ami) and
[knife-solo](http://matschaffer.github.com/knife-solo/).

The motivation for this project is to

  * Easily build a Debian 7.0 "wheezy" AMI for knife-solo's integration test.
    Wheezy isn't released yet and no official AMIs exist.
  * Demonstrate and test knife-solo and its integration with knife-ec2.
  * Maybe even offer help for building official Debian AMIs in the future.

_**NOTE:** This is a work in progress. Everything might change._

Usage
-----

Requires Ruby and [Bundler](http://gembundler.com/).

Install Knife and needed plugins:

```sh
$ bundle install --binstubs
```

Set you AWS credentials (maybe in _~/.bashrc_ or similar):

```sh
$ export AWS_ACCESS_KEY='XXX'
$ export AWS_SECRET_KEY='YYY'
```

Copy _data_bags/debamine/config.json.template_ to _data_bags/debamine/config.json_
and customize. Especially add your AWS credentials. (Sorry for duplicate config.)
Read protect the file from world.

Spin up the EC2 instance and build an AMI on it:

```sh
$ ./bin/knife ec2 server create
```

Remember to destroy the instance when it is not needed any more:

```sh
$ ./bin/knice ec2 server delete <Instance ID>
```

License and Author
------------------

Licensed under the Apache License, Version 2.0. See [LICENSE.txt](LICENSE.txt).

Copyright © 2013, [Teemu Matilainen](https://github.com/tmatilai) <<teemu.matilainen@iki.fi>>
