public class C3x3_MOM_MOM {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 3
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

                    for middlex1 in 0..<wordCount {

                        if (W.Len[middlex1] == interlockWidth &&
                            W.Start[middlex1][0] == W.Start[middley1][0] &&
                            W.Id[middlex1] != W.Id[middley1]) {
                            //print("middlex1:\(W.Start[middlex1])")

                            for outery2 in 0..<wordCount {

                                if W.Len[outery2] >= interlockHeight + 2 {

                                    let outery2Limit = Int(W.Len[outery2]) - Int(interlockHeight)
                                    for outery2Pos in 1..<outery2Limit {

                                        if (W.Start[outery2][outery2Pos + 0] == W.Start[middlex1][1] &&
                                        W.Id[outery2] != W.Id[middlex1] &&
                                        W.Id[outery2] != W.Id[middley1]) {
                                            //print("outery2:\(W.Start[outery2])")

                                            for outerx2 in 0..<wordCount {

                                                if W.Len[outerx2] >= interlockWidth + 2 {

                                                    let outerx2Limit = Int(W.Len[outerx2]) - Int(interlockWidth)
                                                    for outerx2Pos in 1..<outerx2Limit {

                                                        if (W.Start[outerx2][outerx2Pos + 0] == W.Start[middley1][1] &&
                                                        W.Start[outerx2][outerx2Pos + 1] == W.Start[outery2][outery2Pos + 1] &&
                                                        W.Id[outerx2] != W.Id[outery2] &&
                                                        W.Id[outerx2] != W.Id[middlex1] &&
                                                        W.Id[outerx2] != W.Id[middley1]) {
                                                            //print("outerx2:\(W.Start[outerx2])")

                                                            for middley3 in 0..<wordCount {

                                                                if (W.Len[middley3] == interlockHeight &&
                                                                    W.Start[middley3][0] == W.Start[middlex1][2] &&
                                                                    W.Start[middley3][1] == W.Start[outerx2][outerx2Pos + 2] &&
                                                                    W.Id[middley3] != W.Id[outerx2] &&
                                                                    W.Id[middley3] != W.Id[outery2] &&
                                                                    W.Id[middley3] != W.Id[middlex1] &&
                                                                    W.Id[middley3] != W.Id[middley1]) {
                                                                    //print("middley3:\(W.Start[middley3])")

                                                                    for middlex3 in 0..<wordCount {

                                                                        if (W.Len[middlex3] == interlockWidth &&
                                                                            W.Start[middlex3][0] == W.Start[middley1][2] &&
                                                                            W.Start[middlex3][1] == W.Start[outery2][outery2Pos + 2] &&
                                                                            W.Start[middlex3][2] == W.Start[middley3][2] &&
                                                                            W.Id[middlex3] != W.Id[middley3] &&
                                                                            W.Id[middlex3] != W.Id[outerx2] &&
                                                                            W.Id[middlex3] != W.Id[outery2] &&
                                                                            W.Id[middlex3] != W.Id[middlex1] &&
                                                                            W.Id[middlex3] != W.Id[middley1]) {
                                                                            //print("middlex3:\(W.Start[middlex3])")

                                                                            if phase == 0 {
                                                                                shapeCount += 1
                                                                            }
                                                                            else {
                                                                                outerStart[index + 1] = UInt8(outerx2Pos)

                                                                                outerStart[index + 4] = UInt8(outery2Pos)

                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [middlex1, outerx2, middlex3, middley1, outery2, middley3])
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

        return RemoveDuplicates.RemoveDuplicates3x3(cluster: ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.middle, .outer, .middle],
            patternVertical: [.middle, .outer, .middle],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount))
    }
}