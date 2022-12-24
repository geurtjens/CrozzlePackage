public class C3x6_LRMMOM_UMD {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 6
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
                outerStart = Array(repeating: 0, count: stride * shapeCount)
            }

            for up1 in 0..<wordCount {

                if (W.Len[up1] >= interlockHeight) {
                    //print("up1:\(W.Start[up1])")

                    for left1 in 0..<wordCount {

                        if (W.Len[left1] >= interlockWidth &&
                            W.End[left1][2] == W.End[up1][5] &&
                            W.Id[left1] != W.Id[up1]) {
                            //print("left1:\(W.Start[left1])")

                            for middley2 in 0..<wordCount {

                                if (W.Len[middley2] == interlockHeight &&
                                    W.Start[middley2][0] == W.End[left1][1] &&
                                    W.Id[middley2] != W.Id[left1] &&
                                    W.Id[middley2] != W.Id[up1]) {
                                    //print("middley2:\(W.Start[middley2])")

                                    for right2 in 0..<wordCount {

                                        if (W.Len[right2] >= interlockWidth &&
                                            W.Start[right2][0] == W.End[up1][4] &&
                                            W.Start[right2][1] == W.Start[middley2][1] &&
                                            W.Id[right2] != W.Id[middley2] &&
                                            W.Id[right2] != W.Id[left1] &&
                                            W.Id[right2] != W.Id[up1]) {
                                            //print("right2:\(W.Start[right2])")

                                            for down3 in 0..<wordCount {

                                                if (W.Len[down3] >= interlockHeight &&
                                                    W.Start[down3][0] == W.End[left1][0] &&
                                                    W.Start[down3][1] == W.Start[right2][2] &&
                                                    W.Id[down3] != W.Id[right2] &&
                                                    W.Id[down3] != W.Id[middley2] &&
                                                    W.Id[down3] != W.Id[left1] &&
                                                    W.Id[down3] != W.Id[up1]) {
                                                    //print("down3:\(W.Start[down3])")

                                                    for middlex3 in 0..<wordCount {

                                                        if (W.Len[middlex3] == interlockWidth &&
                                                            W.Start[middlex3][0] == W.End[up1][3] &&
                                                            W.Start[middlex3][1] == W.Start[middley2][2] &&
                                                            W.Start[middlex3][2] == W.Start[down3][2] &&
                                                            W.Id[middlex3] != W.Id[down3] &&
                                                            W.Id[middlex3] != W.Id[right2] &&
                                                            W.Id[middlex3] != W.Id[middley2] &&
                                                            W.Id[middlex3] != W.Id[left1] &&
                                                            W.Id[middlex3] != W.Id[up1]) {
                                                            //print("middlex3:\(W.Start[middlex3])")

                                                            for middlex4 in 0..<wordCount {

                                                                if (W.Len[middlex4] == interlockWidth &&
                                                                    W.Start[middlex4][0] == W.End[up1][2] &&
                                                                    W.Start[middlex4][1] == W.Start[middley2][3] &&
                                                                    W.Start[middlex4][2] == W.Start[down3][3] &&
                                                                    W.Id[middlex4] != W.Id[middlex3] &&
                                                                    W.Id[middlex4] != W.Id[down3] &&
                                                                    W.Id[middlex4] != W.Id[right2] &&
                                                                    W.Id[middlex4] != W.Id[middley2] &&
                                                                    W.Id[middlex4] != W.Id[left1] &&
                                                                    W.Id[middlex4] != W.Id[up1]) {
                                                                    //print("middlex4:\(W.Start[middlex4])")

                                                                    for outerx5 in 0..<wordCount {

                                                                        if W.Len[outerx5] >= interlockWidth + 2 {

                                                                            let outerx5Limit = Int(W.Len[outerx5]) - Int(interlockWidth)
                                                                            for outerx5Pos in 1..<outerx5Limit {

                                                                                if (W.Start[outerx5][outerx5Pos + 0] == W.End[up1][1] &&
                                                                                W.Start[outerx5][outerx5Pos + 1] == W.Start[middley2][4] &&
                                                                                W.Start[outerx5][outerx5Pos + 2] == W.Start[down3][4] &&
                                                                                W.Id[outerx5] != W.Id[middlex4] &&
                                                                                W.Id[outerx5] != W.Id[middlex3] &&
                                                                                W.Id[outerx5] != W.Id[down3] &&
                                                                                W.Id[outerx5] != W.Id[right2] &&
                                                                                W.Id[outerx5] != W.Id[middley2] &&
                                                                                W.Id[outerx5] != W.Id[left1] &&
                                                                                W.Id[outerx5] != W.Id[up1]) {
                                                                                    //print("outerx5:\(W.Start[outerx5])")

                                                                                    for middlex6 in 0..<wordCount {

                                                                                        if (W.Len[middlex6] == interlockWidth &&
                                                                                            W.Start[middlex6][0] == W.End[up1][0] &&
                                                                                            W.Start[middlex6][1] == W.Start[middley2][5] &&
                                                                                            W.Start[middlex6][2] == W.Start[down3][5] &&
                                                                                            W.Id[middlex6] != W.Id[outerx5] &&
                                                                                            W.Id[middlex6] != W.Id[middlex4] &&
                                                                                            W.Id[middlex6] != W.Id[middlex3] &&
                                                                                            W.Id[middlex6] != W.Id[down3] &&
                                                                                            W.Id[middlex6] != W.Id[right2] &&
                                                                                            W.Id[middlex6] != W.Id[middley2] &&
                                                                                            W.Id[middlex6] != W.Id[left1] &&
                                                                                            W.Id[middlex6] != W.Id[up1]) {
                                                                                            //print("middlex6:\(W.Start[middlex6])")

                                                                                            if phase == 0 {
                                                                                                shapeCount += 1
                                                                                            }
                                                                                            else {
                                                                                                outerStart[index + 4] = UInt8(outerx5Pos)

                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, right2, middlex3, middlex4, outerx5, middlex6, up1, middley2, down3])
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.leading, .trailing, .middle, .middle, .outer, .middle],
            patternVertical: [.leading, .middle, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}