# CitibikeNYC Dashboard

A simple dashboard that display the status for selected CitibikeNYC stations. Check the [live demo](http://se-citibike.herokuapp.com) for the stations near to [StreetEasy](http://streeteasy.com).

Developed using [Dashing](http://shopify.github.com/dashing) and [Citibikenyc ruby gem](http://github.com/edgar/citibikenyc).

## How to define the stations to display

The code expects an environment variable called `CITIBIKE_NEARBY_STATIONS` to contain a list of station IDs.

In your local sandbox you can use [Foreman](http://github.com/ddollar/foreman) and define the environment variable in the `.env` file (you can check the `.env.sample` file supplied in the repository):

    CITIBIKE_NEARBY_STATIONS="268,257,2010"

And then start the server with:

    $ foreman start

If your dashboard is hosted on Heroku, you will need to create a config var:

    $ heroku config:add CITIBIKE_NEARBY_STATIONS="268,257,2010" -a <my heroku app>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


