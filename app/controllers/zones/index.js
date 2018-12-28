"use strict";

import ZoneBase from "./zone";

module.exports = (router, middlewares) => {

    // middleware for this route only
    router.use('/zones', (req, res, next) => next() )

    // all the routes related to '/users'

    const baseZone = new ZoneBase();
    router.route('/zones')
        .all(baseZone.all)
        .get(baseZone.get)
};
