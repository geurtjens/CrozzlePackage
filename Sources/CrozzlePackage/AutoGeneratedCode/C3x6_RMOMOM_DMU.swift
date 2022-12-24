public class C3x6_RMOMOM_DMU {
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

            for down1 in 0..<wordCount {

                if (W.Len[down1] >= interlockHeight) {
                    //print("down1:\(W.Start[down1])")

                    for right1 in 0..<wordCount {

                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.Start[down1][0] &&
                            W.Id[right1] != W.Id[down1]) {
                            //print("right1:\(W.Start[right1])")

                            for middley2 in 0..<wordCount {

                                if (W.Len[middley2] == interlockHeight &&
                                    W.Start[middley2][0] == W.Start[right1][1] &&
                                    W.Id[middley2] != W.Id[right1] &&
                                    W.Id[middley2] != W.Id[down1]) {
                                    //print("middley2:\(W.Start[middley2])")

                                    for middlex2 in 0..<wordCount {

                                        if (W.Len[middlex2] == interlockWidth &&
                                            W.Start[middlex2][0] == W.Start[down1][1] &&
                                            W.Start[middlex2][1] == W.Start[middley2][1] &&
                                            W.Id[middlex2] != W.Id[middley2] &&
                                            W.Id[middlex2] != W.Id[right1] &&
                                            W.Id[middlex2] != W.Id[down1]) {
                                            //print("middlex2:\(W.Start[middlex2])")

                                            for up3 in 0..<wordCount {

                                                if (W.Len[up3] >= interlockHeight &&
                                                    W.End[up3][5] == W.Start[right1][2] &&
                                                    W.End[up3][4] == W.Start[middlex2][2] &&
                                                    W.Id[up3] != W.Id[middlex2] &&
                                                    W.Id[up3] != W.Id[middley2] &&
                                                    W.Id[up3] != W.Id[right1] &&
                                                    W.Id[up3] != W.Id[down1]) {
                                                    //print("up3:\(W.Start[up3])")

                                                    for outerx3 in 0..<wordCount {

                                                        if W.Len[outerx3] >= interlockWidth + 2 {

                                                            let outerx3Limit = Int(W.Len[outerx3]) - Int(interlockWidth)
                                                            for outerx3Pos in 1..<outerx3Limit {

                                                                if (W.Start[outerx3][outerx3Pos + 0] == W.Start[down1][2] &&
                                                                W.Start[outerx3][outerx3Pos + 1] == W.Start[middley2][2] &&
                                                                W.Start[outerx3][outerx3Pos + 2] == W.End[up3][3] &&
                                                                W.Id[outerx3] != W.Id[up3] &&
                                                                W.Id[outerx3] != W.Id[middlex2] &&
                                                                W.Id[outerx3] != W.Id[middley2] &&
                                                                W.Id[outerx3] != W.Id[right1] &&
                                                                W.Id[outerx3] != W.Id[down1]) {
                                                                    //print("outerx3:\(W.Start[outerx3])")

                                                                    for middlex4 in 0..<wordCount {

                                                                        if (W.Len[middlex4] == interlockWidth &&
                                                                            W.Start[middlex4][0] == W.Start[down1][3] &&
                                                                            W.Start[middlex4][1] == W.Start[middley2][3] &&
                                                                            W.Start[middlex4][2] == W.End[up3][2] &&
                                                                            W.Id[middlex4] != W.Id[outerx3] &&
                                                                            W.Id[middlex4] != W.Id[up3] &&
                                                                            W.Id[middlex4] != W.Id[middlex2] &&
                                                                            W.Id[middlex4] != W.Id[middley2] &&
                                                                            W.Id[middlex4] != W.Id[right1] &&
                                                                            W.Id[middlex4] != W.Id[down1]) {
                                                                            //print("middlex4:\(W.Start[middlex4])")

                                                                            for outerx5 in 0..<wordCount {

                                                                                if W.Len[outerx5] >= interlockWidth + 2 {

                                                                                    let outerx5Limit = Int(W.Len[outerx5]) - Int(interlockWidth)
                                                                                    for outerx5Pos in 1..<outerx5Limit {

                                                                                        if (W.Start[outerx5][outerx5Pos + 0] == W.Start[down1][4] &&
                                                                                        W.Start[outerx5][outerx5Pos + 1] == W.Start[middley2][4] &&
                                                                                        W.Start[outerx5][outerx5Pos + 2] == W.End[up3][1] &&
                                                                                        W.Id[outerx5] != W.Id[middlex4] &&
                                                                                        W.Id[outerx5] != W.Id[outerx3] &&
                                                                                        W.Id[outerx5] != W.Id[up3] &&
                                                                                        W.Id[outerx5] != W.Id[middlex2] &&
                                                                                        W.Id[outerx5] != W.Id[middley2] &&
                                                                                        W.Id[outerx5] != W.Id[right1] &&
                                                                                        W.Id[outerx5] != W.Id[down1]) {
                                                                                            //print("outerx5:\(W.Start[outerx5])")

                                                                                            for middlex6 in 0..<wordCount {

                                                                                                if (W.Len[middlex6] == interlockWidth &&
                                                                                                    W.Start[middlex6][0] == W.Start[down1][5] &&
                                                                                                    W.Start[middlex6][1] == W.Start[middley2][5] &&
                                                                                                    W.Start[middlex6][2] == W.End[up3][0] &&
                                                                                                    W.Id[middlex6] != W.Id[outerx5] &&
                                                                                                    W.Id[middlex6] != W.Id[middlex4] &&
                                                                                                    W.Id[middlex6] != W.Id[outerx3] &&
                                                                                                    W.Id[middlex6] != W.Id[up3] &&
                                                                                                    W.Id[middlex6] != W.Id[middlex2] &&
                                                                                                    W.Id[middlex6] != W.Id[middley2] &&
                                                                                                    W.Id[middlex6] != W.Id[right1] &&
                                                                                                    W.Id[middlex6] != W.Id[down1]) {
                                                                                                    //print("middlex6:\(W.Start[middlex6])")

                                                                                                    if phase == 0 {
                                                                                                        shapeCount += 1
                                                                                                    }
                                                                                                    else {
                                                                                                        outerStart[index + 2] = UInt8(outerx3Pos)

                                                                                                        outerStart[index + 4] = UInt8(outerx5Pos)

                                                                                                        ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, middlex2, outerx3, middlex4, outerx5, middlex6, down1, middley2, up3])
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
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.trailing, .middle, .outer, .middle, .outer, .middle],
            patternVertical: [.trailing, .middle, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}