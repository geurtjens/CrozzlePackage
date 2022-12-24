public class C3x4_RLMR_MOM {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 4
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

                    for right1 in 0..<wordCount {

                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.Start[middley1][0] &&
                            W.Id[right1] != W.Id[middley1]) {
                            //print("right1:\(W.Start[right1])")

                            for outery2 in 0..<wordCount {

                                if W.Len[outery2] >= interlockHeight + 2 {

                                    let outery2Limit = Int(W.Len[outery2]) - Int(interlockHeight)
                                    for outery2Pos in 1..<outery2Limit {

                                        if (W.Start[outery2][outery2Pos + 0] == W.Start[right1][1] &&
                                        W.Id[outery2] != W.Id[right1] &&
                                        W.Id[outery2] != W.Id[middley1]) {
                                            //print("outery2:\(W.Start[outery2])")

                                            for left2 in 0..<wordCount {

                                                if (W.Len[left2] >= interlockWidth &&
                                                    W.End[left2][2] == W.Start[middley1][1] &&
                                                    W.End[left2][1] == W.Start[outery2][outery2Pos + 1] &&
                                                    W.Id[left2] != W.Id[outery2] &&
                                                    W.Id[left2] != W.Id[right1] &&
                                                    W.Id[left2] != W.Id[middley1]) {
                                                    //print("left2:\(W.Start[left2])")

                                                    for middley3 in 0..<wordCount {

                                                        if (W.Len[middley3] == interlockHeight &&
                                                            W.Start[middley3][0] == W.Start[right1][2] &&
                                                            W.Start[middley3][1] == W.End[left2][0] &&
                                                            W.Id[middley3] != W.Id[left2] &&
                                                            W.Id[middley3] != W.Id[outery2] &&
                                                            W.Id[middley3] != W.Id[right1] &&
                                                            W.Id[middley3] != W.Id[middley1]) {
                                                            //print("middley3:\(W.Start[middley3])")

                                                            for middlex3 in 0..<wordCount {

                                                                if (W.Len[middlex3] == interlockWidth &&
                                                                    W.Start[middlex3][0] == W.Start[middley1][2] &&
                                                                    W.Start[middlex3][1] == W.Start[outery2][outery2Pos + 2] &&
                                                                    W.Start[middlex3][2] == W.Start[middley3][2] &&
                                                                    W.Id[middlex3] != W.Id[middley3] &&
                                                                    W.Id[middlex3] != W.Id[left2] &&
                                                                    W.Id[middlex3] != W.Id[outery2] &&
                                                                    W.Id[middlex3] != W.Id[right1] &&
                                                                    W.Id[middlex3] != W.Id[middley1]) {
                                                                    //print("middlex3:\(W.Start[middlex3])")

                                                                    for right4 in 0..<wordCount {

                                                                        if (W.Len[right4] >= interlockWidth &&
                                                                            W.Start[right4][0] == W.Start[middley1][3] &&
                                                                            W.Start[right4][1] == W.Start[outery2][outery2Pos + 3] &&
                                                                            W.Start[right4][2] == W.Start[middley3][3] &&
                                                                            W.Id[right4] != W.Id[middlex3] &&
                                                                            W.Id[right4] != W.Id[middley3] &&
                                                                            W.Id[right4] != W.Id[left2] &&
                                                                            W.Id[right4] != W.Id[outery2] &&
                                                                            W.Id[right4] != W.Id[right1] &&
                                                                            W.Id[right4] != W.Id[middley1]) {
                                                                            //print("right4:\(W.Start[right4])")

                                                                            if phase == 0 {
                                                                                shapeCount += 1
                                                                            }
                                                                            else {
                                                                                outerStart[index + 5] = UInt8(outery2Pos)

                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, left2, middlex3, right4, middley1, outery2, middley3])
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
            patternHorizontal: [.trailing, .leading, .middle, .trailing],
            patternVertical: [.middle, .outer, .middle],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}