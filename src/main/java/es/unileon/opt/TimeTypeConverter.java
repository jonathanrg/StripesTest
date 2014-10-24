/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/

package es.unileon.opt;


import net.sourceforge.stripes.validation.DateTypeConverter;


public class TimeTypeConverter extends DateTypeConverter {
    private static final String[] TIME_FORMAT = { "HH:mm" };
    @Override
    protected String[] getFormatStrings() {
        return TIME_FORMAT;
    }
}

