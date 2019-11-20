import java.util.Deque;
import java.util.LinkedList;

DelaunayTriangulation hoge;

void setup()
{
    size(1600,1600);
    hoge = new DelaunayTriangulation();
}

void draw()
{
    background(#FFFFFF);
    noFill();
    stroke(#000000);
    strokeWeight(3);

    hoge.Draw();
}

void mousePressed()
{
    hoge.AddPoint(new PVector(mouseX,mouseY));
}

void point(float x, float y)
{
    strokeWeight(3);
    circle(x, y, 10);
}