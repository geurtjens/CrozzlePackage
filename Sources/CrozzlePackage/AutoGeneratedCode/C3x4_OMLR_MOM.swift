public class C3x4_OMLR_MOM {
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

                    for outerx1 in 0..<wordCount {

                        if W.Len[outerx1] >= interlockWidth + 2 {

                            let outerx1Limit = Int(W.Len[outerx1]) - Int(interlockWidth)
                            for outerx1Pos in 1..<outerx1Limit {

                                if (W.Start[outerx1][outerx1Pos + 0] == W.Start[middley1][0] &&
                                W.Id[outerx1] != W.Id[middley1]) {
                                    //print("outerx1:\(W.Start[outerx1])")

                                    for outery2 in 0..<wordCount {

                                        if W.Len[outery2] >= interlockHeight + 2 {

                                            let outery2Limit = Int(W.Len[outery2]) - Int(interlockHeight)
                                            for outery2Pos in 1..<outery2Limit {

                                                if (W.Start[outery2][outery2Pos + 0] == W.Start[outerx1][outerx1Pos + 1] &&
                                                W.Id[outery2] != W.Id[outerx1] &&
                                                W.Id[outery2] != W.Id[middley1]) {
                                                    //print("outery2:\(W.Start[outery2])")

                                                    for middlex2 in 0..<wordCount {

                                                        if (W.Len[middlex2] == interlockWidth &&
                                                            W.Start[middlex2][0] == W.Start[middley1][1] &&
                                                            W.Start[middlex2][1] == W.Start[outery2][outery2Pos + 1] &&
                                                            W.Id[middlex2] != W.Id[outery2] &&
                                                            W.Id[middlex2] != W.Id[outerx1] &&
                                                            W.Id[middlex2] != W.Id[middley1]) {
                                                            //print("middlex2:\(W.Start[middlex2])")

                                                            for middley3 in 0..<wordCount {

                                                                if (W.Len[middley3] == interlockHeight &&
                                                                    W.Start[middley3][0] == W.Start[outerx1][outerx1Pos + 2] &&
                                                                    W.Start[middley3][1] == W.Start[middlex2][2] &&
                                                                    W.Id[middley3] != W.Id[middlex2] &&
                                                                    W.Id[middley3] != W.Id[outery2] &&
                                                                    W.Id[middley3] != W.Id[outerx1] &&
                                                                    W.Id[middley3] != W.Id[middley1]) {
                                                                    //print("middley3:\(W.Start[middley3])")

                                                                    for left3 in 0..<wordCount {

                                                                        if (W.Len[left3] >= interlockWidth &&
                                                                            W.End[left3][2] == W.Start[middley1][2] &&
                                                                            W.End[left3][1] == W.Start[outery2][outery2Pos + 2] &&
                                                                            W.End[left3][0] == W.Start[middley3][2] &&
                                                                            W.Id[left3] != W.Id[middley3] &&
                                                                            W.Id[left3] != W.Id[middlex2] &&
                                                                            W.Id[left3] != W.Id[outery2] &&
                                                                            W.Id[left3] != W.Id[outerx1] &&
                                                                            W.Id[left3] != W.Id[middley1]) {
                                                                            //print("left3:\(W.Start[left3])")

                                                                            for right4 in 0..<wordCount {

                                                                                if (W.Len[right4] >= interlockWidth &&
                                                                                    W.Start[right4][0] == W.Start[middley1][3] &&
                                                                                    W.Start[right4][1] == W.Start[outery2][outery2Pos + 3] &&
                                                                                    W.Start[right4][2] == W.Start[middley3][3] &&
                                                                                    W.Id[right4] != W.Id[left3] &&
                                                                                    W.Id[right4] != W.Id[middley3] &&
                                                                                    W.Id[right4] != W.Id[middlex2] &&
                                                                                    W.Id[right4] != W.Id[outery2] &&
                                                                                    W.Id[right4] != W.Id[outerx1] &&
                                                                                    W.Id[right4] != W.Id[middley1]) {
                                                                                    //print("right4:\(W.Start[right4])")

                                                                                    if phase == 0 {
                                                                                        shapeCount += 1
                                                                                    }
                                                                                    else {
                                                                                        outerStart[index + 0] = UInt8(outerx1Pos)

                                                                                        outerStart[index + 5] = UInt8(outery2Pos)

                                                                                        ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [outerx1, middlex2, left3, right4, middley1, outery2, middley3])
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
            patternHorizontal: [.outer, .middle, .leading, .trailing],
            patternVertical: [.middle, .outer, .middle],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}