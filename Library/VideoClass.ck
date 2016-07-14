//
//  VideoClass.ck
//  CHmUsiCK OSC interface (experimental)
//
//  Created by Esteban Betancur on 02/06/16.
//  Medellín - Colombia
//


public class Video
{
    OscOut out;
    
    5001 => int Port;
    "localhost" => string Host;
    
    out.dest(Host,Port);
    
    public int port (int newPort) 
    {
        newPort => Port;
        return Port;
    }
    public int port () 
    {
        return Port;
    }
    public string host (string newHost) 
    {
        newHost => Host;
        return Host;
    }
    public string host () 
    {
        return Host;
    }
    public string red()
    {
        return "/master/red";
    }
    public string green()
    {
        return "/master/green";
    }
    public string blue()
    {
        return "/master/blue";
    }
    public string level()
    {
        return "/master/level";
    }
    public string pixelate()
    {
        return "/1/pixel";
    }
    public string mix()
    {
        return "/master/mix";
    }
    public string gray()
    {
        return "/1/gscale";
    }
    public string noise()
    {
        return "/1/cscale";
    }
    public string source()
    {
        return "/source";
    }
    public string sin()
    {
        return "/1/sin";
    }
    public string cos()
    {
        return "/1/cos";
    }
    public void send(string tag, int msg)
    {
        out.start(tag);
        out.add(msg);
        out.send();
    }
    public void send(string tag, float msg)
    {
        out.start(tag);
        out.add(msg);
        out.send();
    }
    public void send(string tag, string msg)
    {
        out.start(tag);
        out.add(msg);
        out.send();
    }
}