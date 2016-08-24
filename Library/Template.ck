//
//  CHmUsiCK template to add new Synths
//
//  Created by Esteban Betancur on 4/11/15.
//  Esteban Betancur , Medellín, Colombia
//

public class /*NAME*/ extends Chmusick // don't change this
{
    /*make a great patch and =>*/ Gain Normalize => Gain vol => Master; 
    
    /*0*/ => Normalize.gain; // this gain should not be changed
    
    /* add member variables and methods to change and read values */
    
    
    public float gain(float parameter)
    {
        parameter => vol.gain;
        return parameter;
    }
    public float gain() //every method has set and read
    {
        return vol.gain();
    }
}