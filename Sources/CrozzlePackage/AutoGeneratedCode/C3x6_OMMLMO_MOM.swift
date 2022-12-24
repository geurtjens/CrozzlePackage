public class C3x6_OMMLMO_MOM {
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

                                                                    for middlex3 in 0..<wordCount {

                                                                        if (W.Len[middlex3] == interlockWidth &&
                                                                            W.Start[middlex3][0] == W.Start[middley1][2] &&
                                                                            W.Start[middlex3][1] == W.Start[outery2][outery2Pos + 2] &&
                                                                            W.Start[middlex3][2] == W.Start[middley3][2] &&
                                                                            W.Id[middlex3] != W.Id[middley3] &&
                                                                            W.Id[middlex3] != W.Id[middlex2] &&
                                                                            W.Id[middlex3] != W.Id[outery2] &&
                                                                            W.Id[middlex3] != W.Id[outerx1] &&
                                                                            W.Id[middlex3] != W.Id[middley1]) {
                                                                            //print("middlex3:\(W.Start[middlex3])")

                                                                            for left4 in 0..<wordCount {

                                                                                if (W.Len[left4] >= interlockWidth &&
                                                                                    W.End[left4][2] == W.Start[middley1][3] &&
                                                                                    W.End[left4][1] == W.Start[outery2][outery2Pos + 3] &&
                                                                                    W.End[left4][0] == W.Start[middley3][3] &&
                                                                                    W.Id[left4] != W.Id[middlex3] &&
                                                                                    W.Id[left4] != W.Id[middley3] &&
                                                                                    W.Id[left4] != W.Id[middlex2] &&
                                                                                    W.Id[left4] != W.Id[outery2] &&
                                                                                    W.Id[left4] != W.Id[outerx1] &&
                                                                                    W.Id[left4] != W.Id[middley1]) {
                                                                                    //print("left4:\(W.Start[left4])")

                                                                                    for middlex5 in 0..<wordCount {

                                                                                        if (W.Len[middlex5] == interlockWidth &&
                                                                                            W.Start[middlex5][0] == W.Start[middley1][4] &&
                                                                                            W.Start[middlex5][1] == W.Start[outery2][outery2Pos + 4] &&
                                                                                            W.Start[middlex5][2] == W.Start[middley3][4] &&
                                                                                            W.Id[middlex5] != W.Id[left4] &&
                                                                                            W.Id[middlex5] != W.Id[middlex3] &&
                                                                                            W.Id[middlex5] != W.Id[middley3] &&
                                                                                            W.Id[middlex5] != W.Id[middlex2] &&
                                                                                            W.Id[middlex5] != W.Id[outery2] &&
                                                                                            W.Id[middlex5] != W.Id[outerx1] &&
                                                                                            W.Id[middlex5] != W.Id[middley1]) {
                                                                                            //print("middlex5:\(W.Start[middlex5])")

                                                                                            for outerx6 in 0..<wordCount {

                                                                                                if W.Len[outerx6] >= interlockWidth + 2 {

                                                                                                    let outerx6Limit = Int(W.Len[outerx6]) - Int(interlockWidth)
                                                                                                    for outerx6Pos in 1..<outerx6Limit {

                                                                                                        if (W.Start[outerx6][outerx6Pos + 0] == W.Start[middley1][5] &&
                                                                                                        W.Start[outerx6][outerx6Pos + 1] == W.Start[outery2][outery2Pos + 5] &&
                                                                                                        W.Start[outerx6][outerx6Pos + 2] == W.Start[middley3][5] &&
                                                                                                        W.Id[outerx6] != W.Id[middlex5] &&
                                                                                                        W.Id[outerx6] != W.Id[left4] &&
                                                                                                        W.Id[outerx6] != W.Id[middlex3] &&
                                                                                                        W.Id[outerx6] != W.Id[middley3] &&
                                                                                                        W.Id[outerx6] != W.Id[middlex2] &&
                                                                                                        W.Id[outerx6] != W.Id[outery2] &&
                                                                                                        W.Id[outerx6] != W.Id[outerx1] &&
                                                                                                        W.Id[outerx6] != W.Id[middley1]) {
                                                                                                            //print("outerx6:\(W.Start[outerx6])")

                                                                                                            if phase == 0 {
                                                                                                                shapeCount += 1
                                                                                                            }
                                                                                                            else {
                                                                                                                outerStart[index + 0] = UInt8(outerx1Pos)

                                                                                                                outerStart[index + 5] = UInt8(outerx6Pos)

                                                                                                                outerStart[index + 7] = UInt8(outery2Pos)

                                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [outerx1, middlex2, middlex3, left4, middlex5, outerx6, middley1, outery2, middley3])
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
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.outer, .middle, .middle, .leading, .middle, .outer],
            patternVertical: [.middle, .outer, .middle],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}