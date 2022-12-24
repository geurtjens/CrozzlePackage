public class C3x6_LRLRMO_MOM {
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

                    for left1 in 0..<wordCount {

                        if (W.Len[left1] >= interlockWidth &&
                            W.End[left1][2] == W.Start[middley1][0] &&
                            W.Id[left1] != W.Id[middley1]) {
                            //print("left1:\(W.Start[left1])")

                            for outery2 in 0..<wordCount {

                                if W.Len[outery2] >= interlockHeight + 2 {

                                    let outery2Limit = Int(W.Len[outery2]) - Int(interlockHeight)
                                    for outery2Pos in 1..<outery2Limit {

                                        if (W.Start[outery2][outery2Pos + 0] == W.End[left1][1] &&
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

                                                    for middley3 in 0..<wordCount {

                                                        if (W.Len[middley3] == interlockHeight &&
                                                            W.Start[middley3][0] == W.End[left1][0] &&
                                                            W.Start[middley3][1] == W.Start[right2][2] &&
                                                            W.Id[middley3] != W.Id[right2] &&
                                                            W.Id[middley3] != W.Id[outery2] &&
                                                            W.Id[middley3] != W.Id[left1] &&
                                                            W.Id[middley3] != W.Id[middley1]) {
                                                            //print("middley3:\(W.Start[middley3])")

                                                            for left3 in 0..<wordCount {

                                                                if (W.Len[left3] >= interlockWidth &&
                                                                    W.End[left3][2] == W.Start[middley1][2] &&
                                                                    W.End[left3][1] == W.Start[outery2][outery2Pos + 2] &&
                                                                    W.End[left3][0] == W.Start[middley3][2] &&
                                                                    W.Id[left3] != W.Id[middley3] &&
                                                                    W.Id[left3] != W.Id[right2] &&
                                                                    W.Id[left3] != W.Id[outery2] &&
                                                                    W.Id[left3] != W.Id[left1] &&
                                                                    W.Id[left3] != W.Id[middley1]) {
                                                                    //print("left3:\(W.Start[left3])")

                                                                    for right4 in 0..<wordCount {

                                                                        if (W.Len[right4] >= interlockWidth &&
                                                                            W.Start[right4][0] == W.Start[middley1][3] &&
                                                                            W.Start[right4][1] == W.Start[outery2][outery2Pos + 3] &&
                                                                            W.Start[right4][2] == W.Start[middley3][3] &&
                                                                            W.Id[right4] != W.Id[left3] &&
                                                                            W.Id[right4] != W.Id[middley3] &&
                                                                            W.Id[right4] != W.Id[right2] &&
                                                                            W.Id[right4] != W.Id[outery2] &&
                                                                            W.Id[right4] != W.Id[left1] &&
                                                                            W.Id[right4] != W.Id[middley1]) {
                                                                            //print("right4:\(W.Start[right4])")

                                                                            for middlex5 in 0..<wordCount {

                                                                                if (W.Len[middlex5] == interlockWidth &&
                                                                                    W.Start[middlex5][0] == W.Start[middley1][4] &&
                                                                                    W.Start[middlex5][1] == W.Start[outery2][outery2Pos + 4] &&
                                                                                    W.Start[middlex5][2] == W.Start[middley3][4] &&
                                                                                    W.Id[middlex5] != W.Id[right4] &&
                                                                                    W.Id[middlex5] != W.Id[left3] &&
                                                                                    W.Id[middlex5] != W.Id[middley3] &&
                                                                                    W.Id[middlex5] != W.Id[right2] &&
                                                                                    W.Id[middlex5] != W.Id[outery2] &&
                                                                                    W.Id[middlex5] != W.Id[left1] &&
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
                                                                                                W.Id[outerx6] != W.Id[right4] &&
                                                                                                W.Id[outerx6] != W.Id[left3] &&
                                                                                                W.Id[outerx6] != W.Id[middley3] &&
                                                                                                W.Id[outerx6] != W.Id[right2] &&
                                                                                                W.Id[outerx6] != W.Id[outery2] &&
                                                                                                W.Id[outerx6] != W.Id[left1] &&
                                                                                                W.Id[outerx6] != W.Id[middley1]) {
                                                                                                    //print("outerx6:\(W.Start[outerx6])")

                                                                                                    if phase == 0 {
                                                                                                        shapeCount += 1
                                                                                                    }
                                                                                                    else {
                                                                                                        outerStart[index + 5] = UInt8(outerx6Pos)

                                                                                                        outerStart[index + 7] = UInt8(outery2Pos)

                                                                                                        ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, right2, left3, right4, middlex5, outerx6, middley1, outery2, middley3])
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
            patternHorizontal: [.leading, .trailing, .leading, .trailing, .middle, .outer],
            patternVertical: [.middle, .outer, .middle],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}