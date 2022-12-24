public class C3x5_MOMML_DMU {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 5
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

                    for middlex1 in 0..<wordCount {

                        if (W.Len[middlex1] == interlockWidth &&
                            W.Start[middlex1][0] == W.Start[down1][0] &&
                            W.Id[middlex1] != W.Id[down1]) {
                            //print("middlex1:\(W.Start[middlex1])")

                            for middley2 in 0..<wordCount {

                                if (W.Len[middley2] == interlockHeight &&
                                    W.Start[middley2][0] == W.Start[middlex1][1] &&
                                    W.Id[middley2] != W.Id[middlex1] &&
                                    W.Id[middley2] != W.Id[down1]) {
                                    //print("middley2:\(W.Start[middley2])")

                                    for outerx2 in 0..<wordCount {

                                        if W.Len[outerx2] >= interlockWidth + 2 {

                                            let outerx2Limit = Int(W.Len[outerx2]) - Int(interlockWidth)
                                            for outerx2Pos in 1..<outerx2Limit {

                                                if (W.Start[outerx2][outerx2Pos + 0] == W.Start[down1][1] &&
                                                W.Start[outerx2][outerx2Pos + 1] == W.Start[middley2][1] &&
                                                W.Id[outerx2] != W.Id[middley2] &&
                                                W.Id[outerx2] != W.Id[middlex1] &&
                                                W.Id[outerx2] != W.Id[down1]) {
                                                    //print("outerx2:\(W.Start[outerx2])")

                                                    for up3 in 0..<wordCount {

                                                        if (W.Len[up3] >= interlockHeight &&
                                                            W.End[up3][4] == W.Start[middlex1][2] &&
                                                            W.End[up3][3] == W.Start[outerx2][outerx2Pos + 2] &&
                                                            W.Id[up3] != W.Id[outerx2] &&
                                                            W.Id[up3] != W.Id[middley2] &&
                                                            W.Id[up3] != W.Id[middlex1] &&
                                                            W.Id[up3] != W.Id[down1]) {
                                                            //print("up3:\(W.Start[up3])")

                                                            for middlex3 in 0..<wordCount {

                                                                if (W.Len[middlex3] == interlockWidth &&
                                                                    W.Start[middlex3][0] == W.Start[down1][2] &&
                                                                    W.Start[middlex3][1] == W.Start[middley2][2] &&
                                                                    W.Start[middlex3][2] == W.End[up3][2] &&
                                                                    W.Id[middlex3] != W.Id[up3] &&
                                                                    W.Id[middlex3] != W.Id[outerx2] &&
                                                                    W.Id[middlex3] != W.Id[middley2] &&
                                                                    W.Id[middlex3] != W.Id[middlex1] &&
                                                                    W.Id[middlex3] != W.Id[down1]) {
                                                                    //print("middlex3:\(W.Start[middlex3])")

                                                                    for middlex4 in 0..<wordCount {

                                                                        if (W.Len[middlex4] == interlockWidth &&
                                                                            W.Start[middlex4][0] == W.Start[down1][3] &&
                                                                            W.Start[middlex4][1] == W.Start[middley2][3] &&
                                                                            W.Start[middlex4][2] == W.End[up3][1] &&
                                                                            W.Id[middlex4] != W.Id[middlex3] &&
                                                                            W.Id[middlex4] != W.Id[up3] &&
                                                                            W.Id[middlex4] != W.Id[outerx2] &&
                                                                            W.Id[middlex4] != W.Id[middley2] &&
                                                                            W.Id[middlex4] != W.Id[middlex1] &&
                                                                            W.Id[middlex4] != W.Id[down1]) {
                                                                            //print("middlex4:\(W.Start[middlex4])")

                                                                            for left5 in 0..<wordCount {

                                                                                if (W.Len[left5] >= interlockWidth &&
                                                                                    W.End[left5][2] == W.Start[down1][4] &&
                                                                                    W.End[left5][1] == W.Start[middley2][4] &&
                                                                                    W.End[left5][0] == W.End[up3][0] &&
                                                                                    W.Id[left5] != W.Id[middlex4] &&
                                                                                    W.Id[left5] != W.Id[middlex3] &&
                                                                                    W.Id[left5] != W.Id[up3] &&
                                                                                    W.Id[left5] != W.Id[outerx2] &&
                                                                                    W.Id[left5] != W.Id[middley2] &&
                                                                                    W.Id[left5] != W.Id[middlex1] &&
                                                                                    W.Id[left5] != W.Id[down1]) {
                                                                                    //print("left5:\(W.Start[left5])")

                                                                                    if phase == 0 {
                                                                                        shapeCount += 1
                                                                                    }
                                                                                    else {
                                                                                        outerStart[index + 1] = UInt8(outerx2Pos)

                                                                                        ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [middlex1, outerx2, middlex3, middlex4, left5, down1, middley2, up3])
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
            patternHorizontal: [.middle, .outer, .middle, .middle, .leading],
            patternVertical: [.trailing, .middle, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}