"use strict";

import WeaponBase from "./weapon";

module.exports = (router, middlewares) => {

    // middleware for this route only
    router.use('/weapon', (req, res, next) => next() )

    // all the routes related to '/users'

    const baseWeapon = new WeaponBase();
    router.route('/weapons')
        .all(baseWeapon.all)
        .get(baseWeapon.get)
};
