public class C3x6_OMRLRL_OMO {
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

            for outery1 in 0..<wordCount {

                if W.Len[outery1] >= interlockHeight + 2 {

                    let outery1Limit = Int(W.Len[outery1]) - Int(interlockHeight)
                    for outery1Pos in 1..<outery1Limit {

                        //print("outery1:\(W.Start[outery1])")

                        for outerx1 in 0..<wordCount {

                            if W.Len[outerx1] >= interlockWidth + 2 {

                                let outerx1Limit = Int(W.Len[outerx1]) - Int(interlockWidth)
                                for outerx1Pos in 1..<outerx1Limit {

                                    if (W.Start[outerx1][outerx1Pos + 0] == W.Start[outery1][outery1Pos + 0] &&
                                    W.Id[outerx1] != W.Id[outery1]) {
                                        //print("outerx1:\(W.Start[outerx1])")

                                        for middley2 in 0..<wordCount {

                                            if (W.Len[middley2] == interlockHeight &&
                                                W.Start[middley2][0] == W.Start[outerx1][outerx1Pos + 1] &&
                                                W.Id[middley2] != W.Id[outerx1] &&
                                                W.Id[middley2] != W.Id[outery1]) {
                                                //print("middley2:\(W.Start[middley2])")

                                                for middlex2 in 0..<wordCount {

                                                    if (W.Len[middlex2] == interlockWidth &&
                                                        W.Start[middlex2][0] == W.Start[outery1][outery1Pos + 1] &&
                                                        W.Start[middlex2][1] == W.Start[middley2][1] &&
                                                        W.Id[middlex2] != W.Id[middley2] &&
                                                        W.Id[middlex2] != W.Id[outerx1] &&
                                                        W.Id[middlex2] != W.Id[outery1]) {
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
                                                                    W.Id[outery3] != W.Id[outery1]) {
                                                                        //print("outery3:\(W.Start[outery3])")

                                                                        for right3 in 0..<wordCount {

                                                                            if (W.Len[right3] >= interlockWidth &&
                                                                                W.Start[right3][0] == W.Start[outery1][outery1Pos + 2] &&
                                                                                W.Start[right3][1] == W.Start[middley2][2] &&
                                                                                W.Start[right3][2] == W.Start[outery3][outery3Pos + 2] &&
                                                                                W.Id[right3] != W.Id[outery3] &&
                                                                                W.Id[right3] != W.Id[middlex2] &&
                                                                                W.Id[right3] != W.Id[middley2] &&
                                                                                W.Id[right3] != W.Id[outerx1] &&
                                                                                W.Id[right3] != W.Id[outery1]) {
                                                                                //print("right3:\(W.Start[right3])")

                                                                                for left4 in 0..<wordCount {

                                                                                    if (W.Len[left4] >= interlockWidth &&
                                                                                        W.End[left4][2] == W.Start[outery1][outery1Pos + 3] &&
                                                                                        W.End[left4][1] == W.Start[middley2][3] &&
                                                                                        W.End[left4][0] == W.Start[outery3][outery3Pos + 3] &&
                                                                                        W.Id[left4] != W.Id[right3] &&
                                                                                        W.Id[left4] != W.Id[outery3] &&
                                                                                        W.Id[left4] != W.Id[middlex2] &&
                                                                                        W.Id[left4] != W.Id[middley2] &&
                                                                                        W.Id[left4] != W.Id[outerx1] &&
                                                                                        W.Id[left4] != W.Id[outery1]) {
                                                                                        //print("left4:\(W.Start[left4])")

                                                                                        for right5 in 0..<wordCount {

                                                                                            if (W.Len[right5] >= interlockWidth &&
                                                                                                W.Start[right5][0] == W.Start[outery1][outery1Pos + 4] &&
                                                                                                W.Start[right5][1] == W.Start[middley2][4] &&
                                                                                                W.Start[right5][2] == W.Start[outery3][outery3Pos + 4] &&
                                                                                                W.Id[right5] != W.Id[left4] &&
                                                                                                W.Id[right5] != W.Id[right3] &&
                                                                                                W.Id[right5] != W.Id[outery3] &&
                                                                                                W.Id[right5] != W.Id[middlex2] &&
                                                                                                W.Id[right5] != W.Id[middley2] &&
                                                                                                W.Id[right5] != W.Id[outerx1] &&
                                                                                                W.Id[right5] != W.Id[outery1]) {
                                                                                                //print("right5:\(W.Start[right5])")

                                                                                                for left6 in 0..<wordCount {

                                                                                                    if (W.Len[left6] >= interlockWidth &&
                                                                                                        W.End[left6][2] == W.Start[outery1][outery1Pos + 5] &&
                                                                                                        W.End[left6][1] == W.Start[middley2][5] &&
                                                                                                        W.End[left6][0] == W.Start[outery3][outery3Pos + 5] &&
                                                                                                        W.Id[left6] != W.Id[right5] &&
                                                                                                        W.Id[left6] != W.Id[left4] &&
                                                                                                        W.Id[left6] != W.Id[right3] &&
                                                                                                        W.Id[left6] != W.Id[outery3] &&
                                                                                                        W.Id[left6] != W.Id[middlex2] &&
                                                                                                        W.Id[left6] != W.Id[middley2] &&
                                                                                                        W.Id[left6] != W.Id[outerx1] &&
                                                                                                        W.Id[left6] != W.Id[outery1]) {
                                                                                                        //print("left6:\(W.Start[left6])")

                                                                                                        if phase == 0 {
                                                                                                            shapeCount += 1
                                                                                                        }
                                                                                                        else {
                                                                                                            outerStart[index + 0] = UInt8(outerx1Pos)

                                                                                                            outerStart[index + 6] = UInt8(outery1Pos)

                                                                                                            outerStart[index + 8] = UInt8(outery3Pos)

                                                                                                            ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [outerx1, middlex2, right3, left4, right5, left6, outery1, middley2, outery3])
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
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.outer, .middle, .trailing, .leading, .trailing, .leading],
            patternVertical: [.outer, .middle, .outer],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}