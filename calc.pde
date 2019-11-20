import java.util.Deque;
import java.util.LinkedList;

DelaunayTriangulation diagram;

void setup()
{
    size(1600,1600);
    diagram = new DelaunayTriangulation();
}

void draw()
{
    background(#FFFFFF);
    // noFill();
    // stroke(#000000);
    // strokeWeight(3);

    diagram.Draw();
}

void mousePressed()
{
    if(mouseButton == LEFT)
    {
        diagram.AddPoint(new PVector(mouseX,mouseY));
    }
    if(mouseButton == RIGHT)
    {
        diagram.Finalize();
    }
}

void point(float x, float y)
{
    strokeWeight(3);
    circle(x, y, 10);
}