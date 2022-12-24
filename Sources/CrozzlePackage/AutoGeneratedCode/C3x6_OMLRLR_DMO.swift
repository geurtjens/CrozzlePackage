public class C3x6_OMLRLR_DMO {
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

                    for outerx1 in 0..<wordCount {

                        if W.Len[outerx1] >= interlockWidth + 2 {

                            let outerx1Limit = Int(W.Len[outerx1]) - Int(interlockWidth)
                            for outerx1Pos in 1..<outerx1Limit {

                                if (W.Start[outerx1][outerx1Pos + 0] == W.Start[down1][0] &&
                                W.Id[outerx1] != W.Id[down1]) {
                                    //print("outerx1:\(W.Start[outerx1])")

                                    for middley2 in 0..<wordCount {

                                        if (W.Len[middley2] == interlockHeight &&
                                            W.Start[middley2][0] == W.Start[outerx1][outerx1Pos + 1] &&
                                            W.Id[middley2] != W.Id[outerx1] &&
                                            W.Id[middley2] != W.Id[down1]) {
                                            //print("middley2:\(W.Start[middley2])")

                                            for middlex2 in 0..<wordCount {

                                                if (W.Len[middlex2] == interlockWidth &&
                                                    W.Start[middlex2][0] == W.Start[down1][1] &&
                                                    W.Start[middlex2][1] == W.Start[middley2][1] &&
                                                    W.Id[middlex2] != W.Id[middley2] &&
                                                    W.Id[middlex2] != W.Id[outerx1] &&
                                                    W.Id[middlex2] != W.Id[down1]) {
                                                    //print("middlex2:\(W.Start[middlex2])")

                                                    for outery3 in 0..<wordCount {

                                                        if W.Len[outery3] >= interlockHeight + 2 {

                                                            let outery3Limit = Int(W.Len[outery3]) - Int(interlockHeight)
                                                            for outery3Pos in 1..<outery3Limit {

                                                                if (W.Start[outery3][outery3Pos + 0] == W.Start[outerx1][outerx1Pos + 2] &&
                                                                W.Start[outery3][outery3Pos + 1] == W.Start[middlex2][2] &&
                                                                W.Id[outery3] != W.Id[middlex2] &&
                                                                W.Id[outery3] != W.Id[middley2] &&
                                                                W.Id[outery3] != W.Id[outerx1] &&
                                                                W.Id[outery3] != W.Id[down1]) {
                                                                    //print("outery3:\(W.Start[outery3])")

                                                                    for left3 in 0..<wordCount {

                                                                        if (W.Len[left3] >= interlockWidth &&
                                                                            W.End[left3][2] == W.Start[down1][2] &&
                                                                            W.End[left3][1] == W.Start[middley2][2] &&
                                                                            W.End[left3][0] == W.Start[outery3][outery3Pos + 2] &&
                                                                            W.Id[left3] != W.Id[outery3] &&
                                                                            W.Id[left3] != W.Id[middlex2] &&
                                                                            W.Id[left3] != W.Id[middley2] &&
                                                                            W.Id[left3] != W.Id[outerx1] &&
                                                                            W.Id[left3] != W.Id[down1]) {
                                                                            //print("left3:\(W.Start[left3])")

                                                                            for right4 in 0..<wordCount {

                                                                                if (W.Len[right4] >= interlockWidth &&
                                                                                    W.Start[right4][0] == W.Start[down1][3] &&
                                                                                    W.Start[right4][1] == W.Start[middley2][3] &&
                                                                                    W.Start[right4][2] == W.Start[outery3][outery3Pos + 3] &&
                                                                                    W.Id[right4] != W.Id[left3] &&
                                                                                    W.Id[right4] != W.Id[outery3] &&
                                                                                    W.Id[right4] != W.Id[middlex2] &&
                                                                                    W.Id[right4] != W.Id[middley2] &&
                                                                                    W.Id[right4] != W.Id[outerx1] &&
                                                                                    W.Id[right4] != W.Id[down1]) {
                                                                                    //print("right4:\(W.Start[right4])")

                                                                                    for left5 in 0..<wordCount {

                                                                                        if (W.Len[left5] >= interlockWidth &&
                                                                                            W.End[left5][2] == W.Start[down1][4] &&
                                                                                            W.End[left5][1] == W.Start[middley2][4] &&
                                                                                            W.End[left5][0] == W.Start[outery3][outery3Pos + 4] &&
                                                                                            W.Id[left5] != W.Id[right4] &&
                                                                                            W.Id[left5] != W.Id[left3] &&
                                                                                            W.Id[left5] != W.Id[outery3] &&
                                                                                            W.Id[left5] != W.Id[middlex2] &&
                                                                                            W.Id[left5] != W.Id[middley2] &&
                                                                                            W.Id[left5] != W.Id[outerx1] &&
                                                                                            W.Id[left5] != W.Id[down1]) {
                                                                                            //print("left5:\(W.Start[left5])")

                                                                                            for right6 in 0..<wordCount {

                                                                                                if (W.Len[right6] >= interlockWidth &&
                                                                                                    W.Start[right6][0] == W.Start[down1][5] &&
                                                                                                    W.Start[right6][1] == W.Start[middley2][5] &&
                                                                                                    W.Start[right6][2] == W.Start[outery3][outery3Pos + 5] &&
                                                                                                    W.Id[right6] != W.Id[left5] &&
                                                                                                    W.Id[right6] != W.Id[right4] &&
                                                                                                    W.Id[right6] != W.Id[left3] &&
                                                                                                    W.Id[right6] != W.Id[outery3] &&
                                                                                                    W.Id[right6] != W.Id[middlex2] &&
                                                                                                    W.Id[right6] != W.Id[middley2] &&
                                                                                                    W.Id[right6] != W.Id[outerx1] &&
                                                                                                    W.Id[right6] != W.Id[down1]) {
                                                                                                    //print("right6:\(W.Start[right6])")

                                                                                                    if phase == 0 {
                                                                                                        shapeCount += 1
                                                                                                    }
                                                                                                    else {
                                                                                                        outerStart[index + 0] = UInt8(outerx1Pos)

                                                                                                        outerStart[index + 8] = UInt8(outery3Pos)

                                                                                                        ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [outerx1, middlex2, left3, right4, left5, right6, down1, middley2, outery3])
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
            patternHorizontal: [.outer, .middle, .leading, .trailing, .leading, .trailing],
            patternVertical: [.trailing, .middle, .outer],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}