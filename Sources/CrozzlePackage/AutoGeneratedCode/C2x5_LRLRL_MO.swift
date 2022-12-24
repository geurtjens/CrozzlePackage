public class C2x5_LRLRL_MO {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 2
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

            for middley1 in 0..<wordCount {

                if (W.Len[middley1] == interlockHeight) {
                    //print("middley1:\(W.Start[middley1])")

                    for left1 in 0..<wordCount {

                        if (W.Len[left1] >= interlockWidth &&
                            W.End[left1][1] == W.Start[middley1][0] &&
                            W.Id[left1] != W.Id[middley1]) {
                            //print("left1:\(W.Start[left1])")

                            for outery2 in 0..<wordCount {

                                if W.Len[outery2] >= interlockHeight + 2 {

                                    let outery2Limit = Int(W.Len[outery2]) - Int(interlockHeight)
                                    for outery2Pos in 1..<outery2Limit {

                                        if (W.Start[outery2][outery2Pos + 0] == W.End[left1][0] &&
                                        W.Id[outery2] != W.Id[left1] &&
                                        W.Id[outery2] != W.Id[middley1]) {
                                            //print("outery2:\(W.Start[outery2])")

                                            for right2 in 0..<wordCount {

                                                if (W.Len[right2] >= interlockWidth &&
                                                    W.Start[right2][0] == W.Start[middley1][1] &&
                                                    W.Start[right2][1] == W.Start[outery2][outery2Pos + 1] &&
                                                    W.Id[right2] != W.Id[outery2] &&
                                                    W.Id[right2] != W.Id[left1] &&
                                                    W.Id[right2] != W.Id[middley1]) {
                                                    //print("right2:\(W.Start[right2])")

                                                    for left3 in 0..<wordCount {

                                                        if (W.Len[left3] >= interlockWidth &&
                                                            W.End[left3][1] == W.Start[middley1][2] &&
                                                            W.End[left3][0] == W.Start[outery2][outery2Pos + 2] &&
                                                            W.Id[left3] != W.Id[right2] &&
                                                            W.Id[left3] != W.Id[outery2] &&
                                                            W.Id[left3] != W.Id[left1] &&
                                                            W.Id[left3] != W.Id[middley1]) {
                                                            //print("left3:\(W.Start[left3])")

                                                            for right4 in 0..<wordCount {

                                                                if (W.Len[right4] >= interlockWidth &&
                                                                    W.Start[right4][0] == W.Start[middley1][3] &&
                                                                    W.Start[right4][1] == W.Start[outery2][outery2Pos + 3] &&
                                                                    W.Id[right4] != W.Id[left3] &&
                                                                    W.Id[right4] != W.Id[right2] &&
                                                                    W.Id[right4] != W.Id[outery2] &&
                                                                    W.Id[right4] != W.Id[left1] &&
                                                                    W.Id[right4] != W.Id[middley1]) {
                                                                    //print("right4:\(W.Start[right4])")

                                                                    for left5 in 0..<wordCount {

                                                                        if (W.Len[left5] >= interlockWidth &&
                                                                            W.End[left5][1] == W.Start[middley1][4] &&
                                                                            W.End[left5][0] == W.Start[outery2][outery2Pos + 4] &&
                                                                            W.Id[left5] != W.Id[right4] &&
                                                                            W.Id[left5] != W.Id[left3] &&
                                                                            W.Id[left5] != W.Id[right2] &&
                                                                            W.Id[left5] != W.Id[outery2] &&
                                                                            W.Id[left5] != W.Id[left1] &&
                                                                            W.Id[left5] != W.Id[middley1]) {
                                                                            //print("left5:\(W.Start[left5])")

                                                                            if phase == 0 {
                                                                                shapeCount += 1
                                                                            }
                                                                            else {
                                                                                outerStart[index + 6] = UInt8(outery2Pos)

                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, right2, left3, right4, left5, middley1, outery2])
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
            patternHorizontal: [.leading, .trailing, .leading, .trailing, .leading],
            patternVertical: [.middle, .outer],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}