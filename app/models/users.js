"use strict";

import crypto from "crypto";
import CheckIt from "checkit";

import Bookshelf from "../db";
import { sanitize, isName, isID, isExist } from '../helpers/validate';

// related models
// just importing to register it to the Bookshelf register
import "./users-addresses.js";

class Users extends Bookshelf.Model {

    // Initialization
    initialize () {

        // defining events for validation and other stuff
        /*
        this.on("creating", (model, attrs, options) => {
            this.attributes.ID = (this.attributes.ID) ? this.attributes.ID : crypto.randomBytes(16);
            this.id = this.attributes.ID; // because we are using custom id and to overwrite native properties
        }, this);
        */

        this.on("saving", (model, attrs, options) => {

            // preparing the data
            let validateObj = {}, validateRule = {};

            Object.keys(this.attributes).map( key => {
                // sanitizing the input
                this.attributes[key] = (key.includes("ID")) ? this.attributes[key] : sanitize(this.attributes[key]);

                validateObj[key] = (!key.includes("ID")) ? this.attributes[key] : this.attributes[key];
                validateRule[key] = Users.validation_rules()[key];
            });

            if (Object.keys(validateObj).length !== 0) {
                return CheckIt(validateRule).validate(validateObj);
            }

        }, this);
    }

    constructor () {
        super();
        Bookshelf.Model.apply(this, arguments);
    }

    get tableName () { return "users" } // table to map with the DB

    get idAttribute () { return "ID" }


    // Relations
    saves () { return this.hasOne('Saves', 'id', 'id_save') }
    addresses () { return this.hasMany('Users_Addresses', 'User_ID') }

    // Validation Rules
    static validation_rules () { return {
        ID: ['required', val => {
            if (! val instanceof Number) throw new Error("The ID is not valid number");
        }],
        
        Name: ['required', val => {
            if(! val instanceof String) throw new Error('The name is not a valid string')
        }],

        id_save: ['required']
    }}


    // Helper Function
    get StringID () { return this.attributes.ID }

    get getName () { return this.attributes.Name }

    set StringID (string = null) {
        if (string === null) return false;
        return this.attributes.ID = string;
    }

}

export default Bookshelf.model("Users", Users);
