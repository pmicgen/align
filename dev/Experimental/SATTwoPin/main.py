from grid import Grid

def main(n, m, problem):

    g = Grid(n, m, [net for net, _, _ in problem])

    for net, src, tgt in problem:
        g.gen_route_constraints( net, src, tgt)

    g.gen_overlap_constraints()

    g.s.solve()

    assert g.s.state == 'SAT'

    print("="*(m*6-5))
    g.show()
    print("="*(m*6-5))

if __name__ == "__main__":
    main(10, 10, [("a", (3,2), (7,6)), ("b", (6,4), (2,8))])

    """
  01234567
 +--------
0|  1  8  
1|     5
2|12 6  78
3|2   79
4|      6
5|3   54
6| 4    9a
7|  3  a
"""

    main(8, 8, [
        ("1", (2, 0), (0, 2)),
        ("2", (3, 0), (2, 1)),
        ("3", (5, 0), (7, 2)),
        ("4", (6, 1), (5, 5)),
        ("5", (5, 4), (1, 5)),
        ("6", (2, 3), (4, 6)),
        ("7", (3, 4), (2, 6)),
        ("8", (0, 5), (2, 7)),
        ("9", (3, 5), (6, 6)),
        ("a", (7, 5), (6, 7))
        ])


    if False:
        main(24, 24, [
        ("1", (6, 0), (0, 6)),
        ("2", (9, 0), (6, 3)),
        ("3", (15, 0), (21, 6)),
        ("4", (18, 3), (15, 15)),
        ("5", (15, 12), (3, 15)),
        ("6", (6, 9), (12, 18)),
        ("7", (9, 12), (6, 18)),
        ("8", (0, 15), (6, 21)),
        ("9", (9, 15), (18, 18)),
        ("a", (21, 15), (18, 21))
        ])

    if True:
        main(8, 8, [
        ("0", (7, 0), (0, 7)),
        ("1", (7, 1), (1, 7)),
        ("2", (7, 2), (2, 7)),
        ("3", (7, 3), (3, 7)),
        ("4", (7, 4), (4, 7)),
        ("5", (7, 5), (5, 7)),
        ("6", (7, 6), (6, 7)),
        ])


