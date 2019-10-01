
function ValidateCharacters(ch) {
    //alert(ch);
    var key = window.event.keyCode;
    switch (ch) {
        case 1: /*Alpha Numeric with dot and underscore*/
            if ((key >= 48) && (key <= 57) || (key >= 65) && (key <= 90) || (key >= 97) && (key <= 122) || (key == 95) || (key == 46) || (key == 45) || (key == 126) || (key == 13) || (key == 32))
                return true;
            else
                return false;
            break;
        case 2: /*Only Alphabets*/
            if ((key >= 65) && (key <= 90) || (key >= 97) && (key <= 122) || (key == 32) || (key == 13) || (key == 126) || (key == 45))
                return true;
            else
                return false;
            break;
        case 3: /*Alpha numeric */
            //if ((key>=48) &&  ( key<=57) || (key==32) || (key==40) ||  (key==41) ||  (key==44) || (key==45) ||  (key==46) || (key==47)) 
            if ((key >= 48) && (key <= 57) || (key >= 65) && (key <= 90) || (key >= 97) && (key <= 122) || (key == 95) || (key == 46) || (key == 45))
                return true;
            else
                return false;
            break;
        case 4: /* Numbers and colon*/
            if ((key >= 48) && (key <= 57) || (key == 58))
                return true;
            else
                return false;
            break;
        case 5: /* Address Validator*/
            if ((key >= 48) && (key <= 57) || (key >= 65) && (key <= 90) || (key >= 97) && (key <= 122) || (key == 95) || (key == 46) || (key == 45) || (key == 126) || (key == 13))
                return true;
            else
                return false;
            break;
        case 6: /* Floating point Numbers*/
            if ((key >= 48) && (key <= 57) || (key == 46))
                return true;
            else
                return false;
            break;
        case 7: /* Name Validator (Allows alphabets and single qoute )  */
            if ((key >= 65) && (key <= 90) || (key >= 97) && (key <= 122) || (key == 32) || (key == 13) || (key == 45) || (key == 39))
                return true;
            else
                return false;
            break;
        case 8: /* only numbers integer */
            if ((key >= 48 && key <= 57))
                return true;
            else
                return false;
            break;


        case 9: /*Alpha numeric */
            //if ((key>=48) &&  ( key<=57) || (key==32) || (key==40) ||  (key==41) ||  (key==44) || (key==45) ||  (key==46) || (key==47)) 
            if ((key >= 48) && (key <= 57) || (key >= 65) && (key <= 90) || (key >= 97) && (key <= 122) || (key == 95) || (key == 46) || (key == 45) || (key == 32) || (key == 47))
                return true;
            else
                return false;
            break;
    }
}