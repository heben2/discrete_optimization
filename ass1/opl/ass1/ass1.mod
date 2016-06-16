/*********************************************
 * OPL 12.6.0.0 Model
 * Author: jens
 * Creation Date: Oct 6, 2014 at 6:29:04 PM
 *********************************************/

int n = ...; // number of vertices
int dim = ...; // number of dimensions of a vertex

range V = 1..n;
range Dim = 1..dim;

dvar boolean x[V][V];
dvar int+ t[V];

float vertices[V][Dim] = ...;

// objective function

minimize sum(i in V) sum(j in V) sqrt((vertices[i][1] - vertices[j][1])^2 + (vertices[i][2] - vertices[j][2])^2)*x[i][j];

// constraints

subject to {
    forall (j in V)
        sum (i in V: i != j) x[i][j] == 1;

    forall (i in V)
        sum (j in V: i != j) x[i][j] == 1;

    forall (i in V)
        forall (j in V: j != 1)
            t[j] >= t[i] + 1 - n * (1 - x[i][j]);
}