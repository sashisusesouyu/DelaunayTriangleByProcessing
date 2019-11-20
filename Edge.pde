public class Edge
{
    PVector start;
    PVector end;

    public Edge(PVector s, PVector e)
    {
        start = s;
        end = e;
    }

    public void Draw()
    {
        line(start.x, start.y, end.x, end.y);
    }
}