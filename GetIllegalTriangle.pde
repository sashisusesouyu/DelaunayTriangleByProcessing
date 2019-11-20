// public ArrayList<Triangle> GetIllegalTriangle(Triangle ABC, PVector p)
// {
//     PVector A = ABC.A;
//     PVector B = ABC.B;
//     PVector C = ABC.C;

//     //AB x BP, BC x CP, CA x AP
//     PVector ABxBP = Cross(A, B , p);
//     PVector BCxCP = Cross(B, C , p);
//     PVector CAxAP = Cross(C, A , p);

//     PVector[] crossVectors = new PVector[]{ABxBP, BCxCP, CAxAP};

//     ArrayList<PVector> vectorLargeThan0 = new ArrayList<PVector>();
//     ArrayList<PVector> vectorLessThan0 = new ArrayList<PVector>();
    
//     //returnをうまくやるように考える。
//     for(PVector v : crossVectors)
//     {
//         if(v.z >= 0) vectorLargeThan0.add(v);
//         else vectorLessThan0.add(v);
//     }

//     if(vectorLargeThan0.size() < vectorLessThan0.size())
//     {
//         return vectorLessThan0;
//     }
//     else
//     {
//         return vectorLargeThan0;
//     }
// }