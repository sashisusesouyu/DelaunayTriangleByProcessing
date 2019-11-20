public class DelaunayTriangulation
{
    Deque<PVector> points = new LinkedList<PVector>();
    Deque<Triangle> diagram = new LinkedList<Triangle>();
    Triangle superTriangle;

    public DelaunayTriangulation()
    {
        superTriangle = new Triangle(
            new PVector(width/2,0),
            new PVector(0, height),
            new PVector(width,height)
        );
        diagram.add(superTriangle);
        superTriangle.Color = #0000FF;
    }

    void Draw()
    {
        // superTriangle.Draw();
        for(PVector p : points) point(p.x, p.y);
        for(Triangle t : diagram)
        {
            strokeWeight(2);
            Circle c = GetCircumscribedCircle(t);

            stroke(Contains(c, new PVector(mouseX,mouseY))? #F00000 : #000000,100);
            t.Draw();

            stroke(Contains(c, new PVector(mouseX,mouseY))? #F00000 : #A0A0A0, 100);
            noFill();
            c.Draw();
        }
    }

    void AddPoint(PVector p)
    {
        points.add(p);
        Triangulation(p);
    }

    void Triangulation(PVector p)
    {
        //diagramと同じ内容のスタックを組む。
        Deque<Triangle> baseTriangles = CopyStackOf(diagram);

        //分割後の三角形を格納するスタック
        Deque<Triangle> newTriangles = new LinkedList<Triangle>();

        //pを含む三角形を探す

        Triangle ABC = superTriangle;

        for(Triangle t : baseTriangles)
        {
            if(IsInsideOfTriangle(t,p)) ABC = t;
        }

        for(Triangle t : Divide(baseTriangles, ABC, p))
        {
            newTriangles.push(t);
        }
        
        //新しい三角形達でdiagramを更新
        diagram = CopyStackOf(newTriangles);
    }

    Deque<Triangle> Divide(Deque<Triangle> baseTriangles, Triangle checking, PVector p)
    {
        //pがABCの内側にあるため、ABP, BCP, CAPに分割
        Deque<Triangle> divided = new LinkedList<Triangle>();
        divided.push(new Triangle(checking.A,checking.B,p));
        divided.push(new Triangle(checking.B,checking.C,p));
        divided.push(new Triangle(checking.C,checking.A,p));

        Deque<Triangle> newTriangles = new LinkedList<Triangle>();
        //新しくできた三角形の集合dividedに対して処理を行っていく。
        //三角形をABPとして考える。pの対角辺である辺ABを共有する三角形ADBをbaseTrianglesから探す。
        //戻すトライアングル
        while(divided.size()>0)
        {
            Triangle ABC = divided.pop();
            Edge AB = GetOppositeEdge(ABC, p);
            Triangle ADB = GetTriangleShareEdge(ABC,AB,diagram);
            if(IsEqual(ABC,ADB))
            {
                newTriangles.push(ABC);
            }
            else
            {
                PVector D = GetVertexPoint(ADB, AB);
                if(Contains(ABC,D))
                {
                    //FLIP
                    Deque<Triangle> FlipedTriangles = Flip(ADB, AB, p);
                    for(Triangle t : FlipedTriangles) divided.push(t);
                }
                else
                {
                    newTriangles.push(ABC);
                }
            }

        }
        
        return newTriangles;
    }

    Deque<Triangle> Flip(Triangle ADB, Edge AB, PVector p)
    {
        Deque<Triangle> FlipedTriangles = new LinkedList<Triangle>();

        PVector D = GetVertexPoint(ADB,AB);
        PVector A = AB.start;
        PVector B = AB.end;

        FlipedTriangles.push(new Triangle(A,D,p));
        FlipedTriangles.push(new Triangle(D,B,p));

        return FlipedTriangles;
    }

    Deque<Triangle> CopyStackOf(Deque<Triangle> stack)
    {
        Deque<Triangle> returnTriangles = new LinkedList<Triangle>();
        
        for(Triangle item : stack)
        {
            returnTriangles.push(item);
        }
        return returnTriangles;
    }

}