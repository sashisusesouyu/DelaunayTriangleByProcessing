public Triangle GetTriangleShareEdge(Triangle ABC, Edge AB, Deque<Triangle> triangles)
{
    Triangle ADB = ABC;//仮置
    PVector A = AB.start;
    PVector B = AB.end;
    
    boolean detected = false;
    Deque<Triangle> S = new LinkedList<Triangle>();

    while(!detected && triangles.size() > 0)
    {
        Triangle t = triangles.pop();
        if(Contains(t,AB))
        {
            //見つけた三角形をADBとし、辺ABの対角の頂点Dを取得。
            PVector D = GetVertexPoint(t, AB);
            ADB = new Triangle(A, D, B);
            detected = true;
        }
        else
        {
            S.push(t);
        }
    }

    while(S.size() >0)
    {
        triangles.push(S.pop());
    }

    return ADB;
}